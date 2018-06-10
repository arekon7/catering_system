<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Marketingimage;
use App\Http\Requests\CreateImageRequest;
use Illuminate\Support\Facades\Input;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use App\Http\Requests\EditImageRequest;

class MarketingImageController extends Controller
{
    //
    
    public function index(){
           
        $images = Marketingimage::all();
        return view('marketingimage.index', compact('images'));
    }
    
     public function create(){

        return view('marketingimage.create');
    }
    
    public function store(CreateImageRequest $request){
   
        //create new instance of model to save from form

       $marketingImage = new Marketingimage([
           'image_name'        => $request->get('image_name'),
           'image_extension'   => $request->file('image')->getClientOriginalExtension(),
           'mobile_image_name' => $request->get('mobile_image_name'),
           'mobile_extension'  => $request->file('mobile_image')->getClientOriginalExtension(),
           'is_active'         => $request->get('is_active'),
           'is_featured'       => $request->get('is_featured'),

       ]);

       //define the image paths
       
       $destinationFolder = '/imgs/marketing/';
       $destinationThumbnail = '/imgs/marketing/thumbnails/';
       $destinationMobile = '/imgs/marketing/mobile/';

       //assign the image paths to new model, so we can save them to DB

       $marketingImage->image_path = $destinationFolder;
       $marketingImage->mobile_image_path = $destinationMobile;
       
       // format checkbox values and save model

       $this->formatCheckboxValue($marketingImage);
       
       DB::beginTransaction();
       
        $marketingImage->save();

        //parts of the image we will need

        $file = Input::file('image');

        $imageName = $marketingImage->image_name;
        $extension = $request->file('image')->getClientOriginalExtension();

        //create instance of image from temp upload

        $image = Image::make($file->getRealPath());

        //save image with thumbnail

        $image->save(public_path() . $destinationFolder . $imageName . '.' . $extension)
            ->resize(60, 60)
            // ->greyscale()
            ->save(public_path() . $destinationThumbnail . 'thumb-' . $imageName . '.' . $extension);

        // now for mobile

        $mobileFile = Input::file('mobile_image');

        $mobileImageName = $marketingImage->mobile_image_name;
        $mobileExtension = $request->file('mobile_image')->getClientOriginalExtension();

        //create instance of image from temp upload
        $mobileImage = Image::make($mobileFile->getRealPath());
        $mobileImage->save(public_path() . $destinationMobile . $mobileImageName . '.' . $mobileExtension);


        // Process the uploaded image, add $model->attribute and folder name
       DB::commit();
       
       flash()->success('Marketing Image Created!');
//       flash()->overlay('Notice', 'You are now a Laracasts member!');

       return redirect()->route('marketingimage.show', [$marketingImage]);
    }
    
    public function formatCheckboxValue($marketingImage)
        {

           $marketingImage->is_active = ($marketingImage->is_active == null) ? 0 : 1;
           $marketingImage->is_featured = ($marketingImage->is_featured == null) ? 0 : 1;
        }
    
    public function show($id)
    {
       $marketingImage = Marketingimage::findOrFail($id);

       return view('marketingimage.show', compact('marketingImage'));
    }
    
    public function edit($id)
    {

       $marketingImage = Marketingimage::findOrFail($id);

       return view('marketingimage.edit', compact('marketingImage'));
    }

    public function update($id, EditImageRequest $request){
        
       $marketingImage = Marketingimage::findOrFail($id);

       $marketingImage->is_active = $request->get('is_active');
       $marketingImage->is_featured = $request->get('is_featured');

       $this->formatCheckboxValue($marketingImage);
       $marketingImage->save();

       if ( ! empty(Input::file('image'))){

           $destinationFolder = '/imgs/marketing/';
           $destinationThumbnail = '/imgs/marketing/thumbnails/';

           $file = Input::file('image');

           $imageName = $marketingImage->image_name;
           $extension = $request->file('image')->getClientOriginalExtension();

           //create instance of image from temp upload
           $image = Image::make($file->getRealPath());

           //save image with thumbnail
           $image->save(public_path() . $destinationFolder . $imageName . '.' . $extension)
               ->resize(60, 60)
               // ->greyscale()
               ->save(public_path() . $destinationThumbnail . 'thumb-' . $imageName . '.' . $extension);

       }

       if ( ! empty(Input::file('mobile_image'))) {

           $destinationMobile = '/imgs/marketing/mobile/';
           $mobileFile = Input::file('mobile_image');

           $mobileImageName = $marketingImage->mobile_image_name;
           $mobileExtension = $request->file('mobile_image')->getClientOriginalExtension();

           //create instance of image from temp upload
           $mobileImage = Image::make($mobileFile->getRealPath());
           $mobileImage->save(public_path() . $destinationMobile . $mobileImageName . '.' . $mobileExtension);
       }

       flash()->success('image edited!');
       return view('marketingimage.edit', compact('marketingImage'));
    }
    
    public function destroy($id){
           $marketingImage = Marketingimage::findOrFail($id);
           $thumbPath = $marketingImage->image_path.'thumbnails/';

           File::delete(public_path($marketingImage->image_path).
                                    $marketingImage->image_name . '.' .
                                    $marketingImage->image_extension);

           File::delete(public_path($marketingImage->mobile_image_path).
                                    $marketingImage->mobile_image_name . '.' .
                                    $marketingImage->mobile_extension);
           File::delete(public_path($thumbPath). 'thumb-' .
                                    $marketingImage->image_name . '.' .
                                    $marketingImage->image_extension);

            Marketingimage::destroy($id);

//           flash()->overlay('Modal Message', 'Modal Title');
           flash()->success('image deleted!');
           flash('Message', 'success');

           return redirect()->route('marketingimage.index');

        }
    
    
        
        
   
    

    
    }
