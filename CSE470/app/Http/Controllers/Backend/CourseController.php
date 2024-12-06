<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Course;
use App\Models\Course_goal;
#use App\Models\CourseSection;
#use App\Models\CourseLecture;
use Intervention\Image\Facades\Image;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver; 
use Illuminate\Support\Facades\Auth; 
use Carbon\Carbon;
#use Illuminate\Support\Carbon;



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
        $request->validate([
            'video' => 'required|mimes:mp4|max:10000',
            'course_image' => 'required|image|max:2048', // Ensure valid image
        ]);
    
        // Handle course image
        $image = $request->file('course_image');
        $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
        $imagePath = public_path('upload/course/thumbnail/');
    
        // Ensure directory exists
        if (!file_exists($imagePath)) {
            mkdir($imagePath, 0755, true);
        }
    
        // Resize and save the image
        $save_url = 'upload/course/thumbnail/'.$name_gen;
        Image::make($image)
            ->resize(370, 246)
            ->save($imagePath.$name_gen);
    
        // Handle course video
        $video = $request->file('video');
        $videoName = time().'.'.$video->getClientOriginalExtension();
        $videoPath = public_path('upload/course/video/');
    
        // Ensure directory exists
        if (!file_exists($videoPath)) {
            mkdir($videoPath, 0755, true);
        }
    
        $video->move($videoPath, $videoName);
        $save_video = 'upload/course/video/'.$videoName;
    
        // Insert course data
        $course_id = Course::insertGetId([
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'instructor_id' => Auth::user()->id,
            'course_title' => $request->course_title,
            'course_name' => $request->course_name,
            'course_name_slug' => strtolower(str_replace(' ', '-', $request->course_name)),
            'description' => $request->description,
            'video' => $save_video,
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
            'status' => 1,
            'course_image' => $save_url,
            'created_at' => Carbon::now(),
        ]);
    
        // Insert course goals
        if ($request->course_goals) {
            foreach ($request->course_goals as $goal) {
                Course_goal::create([
                    'course_id' => $course_id,
                    'goal_name' => $goal,
                ]);
            }
        }
    
        // Notification
        $notification = [
            'message' => 'Course Inserted Successfully',
            'alert-type' => 'success',
        ];
    
        return redirect()->route('all.course')->with($notification);
    }
    
























} 