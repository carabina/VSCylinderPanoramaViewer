VSCylinderPanoramaViewer
============


VSCylinderPanoramaViewer is an image viewer that allows you to view images as if they are inside a cylinder.

![Demo](https://github.com/veasoftware/VSCylinderPanoramaViewer/raw/master/VSCylinderPanoramaViewer.gif)


Installation
============


Add VSCylinderPanoramaViewer.swift to your project.


Usage
=====

Simply create an instance of VSCylinderPanoramaViewer, set the image name and present the view controller.

```
let vc = VSCylinderPanoramaViewer()
vc.imageName = "photo"
self.presentViewController(vc, animated: true, completion: nil)
```

VSCylinderPanoramaViewer has the ability to pan and a single click will dismiss the viewer.

Image
=====

Image is provided by https://unsplash.com
