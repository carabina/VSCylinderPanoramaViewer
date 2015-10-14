//
//  VSCylinderPanoramaViewer.swift
//
//  Created by PJ Vea on 10/14/15.
//  Copyright © 2015 Vea Software. All rights reserved.
//

import UIKit
import SceneKit

class VSCylinderPanoramaViewer: UIViewController
{
    var imageName: String!
    
    var sceneView: SCNView!
    var geometryNode: SCNNode = SCNNode()
    var currentAngle: Float = 0.0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupScene()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupScene()
    {
        let node = SCNScene()
        
        let tube = SCNTube(innerRadius: 3.0, outerRadius: 3.0, height: 4.7)
        tube.firstMaterial?.diffuse.contents = UIImage(named: self.imageName)
        let cylinderNode = SCNNode(geometry: tube)
        cylinderNode.position = SCNVector3(x: 3.0, y: -1.0, z: 1.0)
        node.rootNode.addChildNode(cylinderNode)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(3, -1, 2)
        node.rootNode.addChildNode(cameraNode)
        
        self.sceneView = SCNView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        self.view.addSubview(self.sceneView)
        
        self.sceneView.scene = node
        self.sceneView.backgroundColor = UIColor.blackColor()
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: "panGesture:")
        self.sceneView.addGestureRecognizer(panRecognizer)
        
        let tap = UITapGestureRecognizer(target: self, action: "viewTapped:")
        tap.numberOfTapsRequired = 1
        self.sceneView.addGestureRecognizer(tap)
        
        self.geometryNode = cylinderNode
    }
    
    func panGesture(sender: UIPanGestureRecognizer)
    {
        let translation = sender.translationInView(sender.view!)
        var newAngle = (Float)(translation.x)*(Float)(M_PI)/180.0
        newAngle += currentAngle
        
        geometryNode.pivot = SCNMatrix4MakeRotation(newAngle, 0, 1, 0)
        
        if(sender.state == UIGestureRecognizerState.Ended)
        {
            currentAngle = newAngle
        }
    }
    
    func viewTapped(sender: UITapGestureRecognizer)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
