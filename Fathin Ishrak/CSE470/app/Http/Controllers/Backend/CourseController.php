<?php

namespace App\Http\Controllers\Backend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Course;
use App\Models\Course_goal;
use App\Models\CourseSection;
use App\Models\CourseLecture;
use Illuminate\Support\Str;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver; 
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth; 
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;





class CourseController extends Controller
{
    public function AllCourse(){

      $id = Auth::user()->id;
      $courses = Course::where('instructor_id',$id)->orderBy('id','desc')->get();
        return view('instructor.courses.all_course',compact('courses'));

    }// End Method 



    public function AddCourse(){

        $categories = Category::latest()->get();
        return view('instructor.courses.add_course',compact('categories'));

    }// End Method 



    
    public function GetSubCategory($category_id){

        $subcat = SubCategory::where('category_id',$category_id)->orderBy('subcategory_name','ASC')->get();
        return json_encode($subcat);

    }



    
    public function StoreCourse(Request $request)
    {
        // Validate the request
        $request->validate([
            'video' => 'required|mimes:mp4|max:10000',  // Ensure video is mp4 and under 10MB
            'course_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',  // Image validation
        ]);

        // Initialize variables
        $videoUrl = null;
        $imageUrl = null;

        try {
            // Handle video upload
            if ($request->hasFile('video')) {
                $video = $request->file('video');
                $videoName = time() . '.' . $video->getClientOriginalExtension();
                $videoPath = public_path('upload/course/video/');

                // Ensure directory exists
                if (!file_exists($videoPath)) {
                    mkdir($videoPath, 0755, true);
                }

                // Move video to the target directory
                $video->move($videoPath, $videoName);
                $videoUrl = 'upload/course/video/' . $videoName;
            }

            // Handle course image upload and resizing
            if ($request->hasFile('course_image')) {
                $image = $request->file('course_image');
                $manager = new ImageManager(new Driver());

                // Generate a unique name for the image
                $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();

                // Resize the image
                $img = $manager->read($image);
                $img->resize(300, 300)  // Resize the image to 300x300
                    ->save(public_path('upload/course/thumbnail/' . $name_gen));

                // Store the image URL
                $imageUrl = 'upload/course/thumbnail/' . $name_gen;
            }

            // Start a database transaction to ensure consistency
            DB::beginTransaction();

            // Insert course data into the 'courses' table
            $course_id = Course::insertGetId([
                'category_id' => $request->category_id,
                'subcategory_id' => $request->subcategory_id,
                'instructor_id' => Auth::user()->id,
                'course_title' => $request->course_title,
                'course_name' => $request->course_name,
                'course_name_slug' => strtolower(preg_replace('/[^a-z0-9]+/', '-', trim($request->course_name))),
                'description' => $request->description,
                'video' => $videoUrl,
                'course_image' => $imageUrl,  // Store the image URL
                'label' => $request->label,
                'duration' => $request->duration,
                'resources' => $request->resources,
                'certificate' => $request->certificate,
                'selling_price' => $request->selling_price,
                'discount_price' => $request->discount_price,
                'prerequisites' => $request->prerequisites,
                'bestseller' => $request->bestseller,
                'featured' => $request->featured,
                'highestrated' => $request->highestrated,
                'status' => 1,  // Active status
                'created_at' => Carbon::now(),
            ]);

            // Insert course goals if provided
            if ($request->course_goals) {
                foreach ($request->course_goals as $goal) {
                    Course_goal::create([
                        'course_id' => $course_id,
                        'goal_name' => $goal,
                    ]);
                }
            }

            // Commit the transaction
            DB::commit();

            // Notification
            return redirect()->route('all.course')->with([
                'message' => 'Course Inserted Successfully',
                'alert-type' => 'success',
            ]);
        } catch (\Exception $e) {
            // Rollback the transaction if an error occurs
            DB::rollback();

            // Return error message if something went wrong
            return back()->withErrors(['message' => 'Error uploading course: ' . $e->getMessage()]);
        }
    }


    public function EditCourse($id){
        $goals = Course_goal::where('course_id',$id)->get();
        $course = Course::find($id);
        $categories = Category::latest()->get();
        $subcategories = SubCategory::latest()->get();
        return view('instructor.courses.edit_course',compact('course','categories','subcategories','goals'));
    }// End Method 




    public function UpdateCourse(Request $request){
        $cid = $request->course_id;
         
           Course::find($cid)->update([
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'instructor_id' => Auth::user()->id,
            'course_title' => $request->course_title,
            'course_name' => $request->course_name,
            'course_name_slug' => strtolower(str_replace(' ', '-', $request->course_name)),
            'description' => $request->description, 
            'label' => $request->label,
            'duration' => $request->duration,
            'resources' => $request->resources,
            'certificate' => $request->certificate,
            'selling_price' => $request->selling_price,
            'discount_price' => $request->discount_price,
            'prerequisites' => $request->prerequisites,
            'bestseller' => $request->bestseller,
            'featured' => $request->featured,
            'highestrated' => $request->highestrated,  
        ]); 
        $notification = array(
            'message' => 'Course Updated Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('all.course')->with($notification);  
    }// End Method 

    
    public function UpdateCourseImage(Request $request){
    // Validate the request
    $request->validate([
        'course_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048', // Image validation
    ]);

    $course_id = $request->id;
    $oldImage = $request->old_img;  // Old image path passed from the request
    $imageUrl = null;

    // Start a database transaction to ensure consistency
    DB::beginTransaction();

    try {
        // Handle course image upload and resizing
        if ($request->hasFile('course_image')) {
            $image = $request->file('course_image');
            
            // Generate a unique name for the image
            $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
            
            // Create ImageManager instance using GD driver
            $manager = new ImageManager(new Driver());

            // Resize the image to 370x246 and save it
            $img = $manager->read($image);
            $img->resize(370, 246)->save(public_path('upload/course/thumbnail/' . $name_gen));

            // Store the image URL
            $imageUrl = 'upload/course/thumbnail/' . $name_gen;

            // Delete the old image if it exists
            if ($oldImage && file_exists(public_path($oldImage))) {
                unlink(public_path($oldImage)); // Delete the old image
            }
        }

        // Update the course image in the database
        Course::find($course_id)->update([
            'course_image' => $imageUrl,  // Update with the new image URL
            'updated_at' => Carbon::now(),
        ]);

        // Commit the transaction
        DB::commit();

        // Return success notification
        $notification = array(
            'message' => 'Course Image Updated Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);

    } catch (\Exception $e) {
        // Rollback the transaction in case of error
        DB::rollback();

        // Return error message if something went wrong
        return back()->withErrors(['message' => 'Error updating course image: ' . $e->getMessage()]);
    }
}// End Method


public function UpdateCourseVideo(Request $request){

    $course_id = $request->vid;
    $oldVideo = $request->old_vid;

    $video = $request->file('video');  
    $videoName = time().'.'.$video->getClientOriginalExtension();
    $video->move(public_path('upload/course/video/'),$videoName);
    $save_video = 'upload/course/video/'.$videoName;

    if (file_exists($oldVideo)) {
        unlink($oldVideo);
    }

    Course::find($course_id)->update([
        'video' => $save_video,
        'updated_at' => Carbon::now(),
    ]);

    $notification = array(
        'message' => 'Course Video Updated Successfully',
        'alert-type' => 'success'
    );
    return redirect()->back()->with($notification); 

}// End Method 






public function UpdateCourseGoal(Request $request){

    $cid = $request->id;

    if ($request->course_goals == NULL) {
        return redirect()->back();
    } else{

        Course_goal::where('course_id',$cid)->delete();

        $goles = Count($request->course_goals);

            for ($i=0; $i < $goles; $i++) { 
                $gcount = new Course_goal();
                $gcount->course_id = $cid;
                $gcount->goal_name = $request->course_goals[$i];
                $gcount->save();
            }  // end for
    } // end else 

    $notification = array(
        'message' => 'Course Goals Updated Successfully',
        'alert-type' => 'success'
    );
    return redirect()->back()->with($notification); 

}// End Method 




public function DeleteCourse($id){
    $course = Course::find($id);
    unlink($course->course_image);
    unlink($course->video);

    Course::find($id)->delete();

    $goalsData = Course_goal::where('course_id',$id)->get();
    foreach ($goalsData as $item) {
        $item->goal_name;
        Course_goal::where('course_id',$id)->delete();
    }

    $notification = array(
        'message' => 'Course Deleted Successfully',
        'alert-type' => 'success'
    );
    return redirect()->back()->with($notification); 

}// End Method 


public function AddCourseLecture($id){

    $course = Course::find($id);

    $section = CourseSection::where('course_id',$id)->latest()->get();

    return view('instructor.courses.section.add_course_lecture',compact('course','section'));
}// End Method 



public function AddCourseSection(Request $request){

    $cid = $request->id;

    CourseSection::insert([
        'course_id' => $cid,
        'section_title' => $request->section_title, 
    ]);

    $notification = array(
        'message' => 'Course Section Added Successfully',
        'alert-type' => 'success'
    );
    return redirect()->back()->with($notification);  

}// End Method 



public function SaveLecture(Request $request){

    $lecture = new CourseLecture();
    $lecture->course_id = $request->course_id;
    $lecture->section_id = $request->section_id;
    $lecture->lecture_title = $request->lecture_title;
    $lecture->url = $request->lecture_url;
    $lecture->content = $request->content;
    $lecture->save();

    return response()->json(['success' => 'Lecture Saved Successfully']);

}// End Method 



public function EditLecture($id){

    $clecture = CourseLecture::find($id);
    return view('instructor.courses.lecture.edit_course_lecture',compact('clecture'));

}// End Method 


public function UpdateCourseLecture(Request $request){
    $lid = $request->id;

    CourseLecture::find($lid)->update([
        'lecture_title' => $request->lecture_title,
        'url' => $request->url,
        'content' => $request->content,

    ]);

    $notification = array(
        'message' => 'Course Lecture Updated Successfully',
        'alert-type' => 'success'
    );
    return redirect()->back()->with($notification);   

}// End Method 


public function DeleteLecture($id){

    CourseLecture::find($id)->delete();

    $notification = array(
        'message' => 'Course Lecture Delete Successfully',
        'alert-type' => 'success'
    );
    return redirect()->back()->with($notification);  

}// End Method 

public function DeleteSection($id){

    $section = CourseSection::find($id);

    /// Delete reated lectures 
    $section->lectures()->delete();
    // Delete the section 
    $section->delete();

    $notification = array(
        'message' => 'Course Section Delete Successfully',
        'alert-type' => 'success'
    );
    return redirect()->back()->with($notification); 

}// End Method 










































































} 