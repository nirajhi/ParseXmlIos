//
//  ViewController.m
//  ParseXML
//
//  Created by admin on 7/28/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ViewController.h"
NSString *appDataPath;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *stringXML;
    stringXML = @"<pigletlist><piglet><name>hari</name><age>12</age></piglet></pigletlist>";
    
    //stringXML = @"<pigletlist><piglet id=\"1\"><name>Nifnif</name></piglet><piglet id=\"2\"><name>Nufnuf</name></piglet><piglet id=\"3\"><name>Nafnaf</name></piglet></pigletlist>";
    //stringXML = @"<pigletlist><piglet id=\"1\"><name>Nifnif</name><name1>Nifnif</name1></piglet><piglet id=\"2\"><name>Nufnuf</name><name1>Nifnif</name1></piglet><piglet id=\"3\"><name>Nafnaf</name><name1>Nifnif</name1></piglet></pigletlist>";
    //stringXML = @"<pigletlist><piglet id=\"1\"><name>Nifnif</name></piglet></pigletlist><pigletlista><pigleta id=\"1\"><namea>Nifnif</namea></pigleta></pigletlista>";
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    appDataPath = [NSString stringWithFormat:@"%@", [array objectAtIndex:0]];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/example.xml",
                          appDataPath];
    
    [stringXML writeToFile:fileName
                atomically:NO
                  encoding:NSStringEncodingConversionAllowLossy
                     error:nil];

    NSMutableArray *res = [[NSMutableArray alloc] init];
    
    NSData *dataFromXMLFile = [NSData dataWithContentsOfFile:fileName];
    
    CXMLDocument *doc = [[CXMLDocument alloc] initWithData:dataFromXMLFile options:0 error:nil];
    NSArray *nodes = NULL;
    
    nodes = [doc nodesForXPath:@"//pigletlist/piglet/name" error:nil];
    
   //int counter;
    NSString *ns;
    for(CXMLElement *node in nodes){
        ns = [node stringValue];
    }
    NSLog(@"%@",ns);
    
//    for (CXMLElement *node in nodes) {
//        // nodenames = [element name];
//        
//        NSLog(@"Child nodes:%lu",[node childCount]);
//        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
//        int counter;
//        
//        for(counter = 0; counter < [node childCount]; counter++) {
//            //  common procedure: dictionary with keys/values from XML node
//            [item setObject:[[node childAtIndex:counter] stringValue] forKey:[[node childAtIndex:counter] name]];
//        }
//        
//        //  and here it is - attributeForName! Simple as that.
//        [item setObject:[[node attributeForName:@"id"] stringValue] forKey:@"id"];  // <------ this magical arrow is pointing to the area of interest
//        
//        [res addObject:item];
//    }
//    //
  //  NSLog(@"%@", res);
    
  //  NSLog(@"%@",appDataPath);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
