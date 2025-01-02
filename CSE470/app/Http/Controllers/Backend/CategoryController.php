<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use App\Models\Category;

use App\Models\SubCategory;

use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;


use Illuminate\Support\Str;


class CategoryController extends Controller{



   



    public function AllCategory(){


        $category = Category::latest()->get();
        return view('admin.backend.category.all_category',compact('category'));

    }


    public function AddCategory(){
        return view('admin.backend.category.add_category');
    }



    


    public function StoreCategory(Request $request){
        if ($request->file('image')) {
            $image = $request->file('image');
            $manager = new ImageManager(new Driver());
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            $img = $manager->read($image); 
            $img->resize(370, 250)->save(public_path('upload/category/' . $name_gen));
            $save_url = 'upload/category/' . $name_gen;
    
            $category = Category::create([
                'category_name' => $request->category_name,
                'category_slug' => Str::slug($request->category_name),
                'image' => $save_url,
            ]);
        }
    
        $notification = array(
            'message' => 'Category Inserted Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('all.category')->with($notification);
    }


    
    public function EditCategory($id){

        $category = Category::find($id);
        return view('admin.backend.category.edit_category',compact('category'));
    }// End Method 






    public function UpdateCategory(Request $request){

        $cat_id = $request->id; 


        if ($request->file('image')) {

            $image = $request->file('image');
            $manager = new ImageManager(new Driver());
            $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
            $img = $manager->read($image); 
            $img->resize(370, 250)->save(public_path('upload/category/' . $name_gen));
            $save_url = 'upload/category/' . $name_gen;
    
            $category = Category::find( $cat_id )->update([
                'category_name' => $request->category_name,
                'category_slug' => Str::slug($request->category_name),
                'image' => $save_url,
            ]);
        
    
        $notification = array(
            'message' => 'Category Updated With Image Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('all.category')->with($notification);
    } else {
        

        $category = Category::find( $cat_id )->update([
            'category_name' => $request->category_name,
            'category_slug' => Str::slug($request->category_name),
           
        ]);
    

    $notification = array(
        'message' => 'Category Updated WithOut Image Successfully',
        'alert-type' => 'success'
    );
    return redirect()->route('all.category')->with($notification);
    }

}//end




public function DeleteCategory($id){

    $item = Category::find($id);
    $img = $item->image;
    unlink($img);

    Category::find($id)->delete();

        $notification = array(
            'message' => 'Category Deleted Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);

}




public function AllSubCategory(){

    $subcategory = SubCategory::latest()->get();
    return view('admin.backend.subcategory.all_subcategory',compact('subcategory'));

}



public function AddSubCategory(){
    $category = Category::latest()->get();
    return view('admin.backend.subcategory.add_subcategory',compact('category'));




}



public function StoreSubCategory(Request $request)
{
    
    $subCategory = SubCategory::create([
        'category_id' => $request->category_id,
        'subcategory_name' => $request->subcategory_name,
        'subcategory_slug' => Str::slug($request->subcategory_name),
    ]);

    
    $notification = array(
        'message' => 'SubCategory Inserted Successfully',
        'alert-type' => 'success'
    );

    return redirect()->route('all.subcategory')->with($notification);
}




 
public function EditSubCategory($id){

    $category = Category::latest()->get();
    $subcategory = SubCategory::find($id);
    return view('admin.backend.subcategory.edit_subcategory',compact('category','subcategory'));

}




public function UpdateSubCategory(Request $request)
{
    $subcat_id = $request->id;

    // Find the SubCategory by ID
    $subCategory = SubCategory::find($subcat_id);

    if ($subCategory) {
        // Update the fields
        $subCategory->update([
            'category_id' => $request->category_id,
            'subcategory_name' => $request->subcategory_name,
            'subcategory_slug' => Str::slug($request->subcategory_name),
        ]);

        // Notification for success
        $notification = array(
            'message' => 'SubCategory Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('all.subcategory')->with($notification);
    } else {
        // If SubCategory not found, return error
        return redirect()->back()->withErrors(['error' => 'SubCategory not found!']);
    }
}



public function DeleteSubCategory($id){ 
    SubCategory::find($id)->delete();

    $notification = array(
        'message' => 'SubCategory Deleted Successfully',
        'alert-type' => 'success'
    );
    return redirect()->back()->with($notification);


}





   
   
   
   

    

    
    




    



    
}
