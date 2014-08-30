//
//  Index4ViewController.m
//  ProjectModel
//
//  Created by dongway on 14-8-9.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "Index4ViewController.h"
#import "InternetRequest.h"
#import "Index4Service.h"

@interface Index4ViewController ()
{

    __weak IBOutlet UITextView *urlTextView;
    __weak IBOutlet UITextField *modelText;
    
    Index4Service *service;
}
@end

@implementation Index4ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    service = [[Index4Service alloc] init];
    NSArray *userinfos = [service getUserinfosWithUsername:@"tx" andPassword:@"123456"];
    [service printUserinfos:userinfos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)produceAction:(id)sender {
    NSString *urlString = urlTextView.text;
    NSString *modelString = modelText.text;
    [InternetRequest dispatch_aync_LoadDataWithUrlString:urlString complite:^(id result){
        NSArray *datas = [result objectForKey:modelString];
        NSDictionary *data = [datas firstObject];
        NSArray *keys = data.allKeys;
        [self produceModelWithKeys:keys];
        [self produceModelsTransformWithModelString:modelString];
        [self produceModelTransformWithKeys:keys andModelString:modelString];

    }];
}

-(void)produceModelWithKeys:(NSArray *)keys{
    NSMutableString *modelContent = [[NSMutableString alloc] init];
    for (NSString *key in keys) {
        [modelContent appendString:[NSString stringWithFormat:@"\n@property (copy, nonatomic) NSString *%@;",key]];
    }
    NSLog(@"%@",modelContent);
}

-(void)produceModelsTransformWithModelString:(NSString *)modelString{
    NSString *ModelString = [NSString stringWithFormat:@"%@Model",[modelString capitalizedString]];
    NSMutableString *modelsTransformContent = [[NSMutableString alloc] init];
    [modelsTransformContent appendString:@"\n-(NSArray *)modelsWithDicts:(NSArray *)dicts{"];
    [modelsTransformContent appendString:@"\n   NSMutableArray *models = [[NSMutableArray alloc] init];"];
    [modelsTransformContent appendString:@"\n   for(NSDictionary *dict in dicts){"];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n        %@ *model = [self modelWithDict:dict];",ModelString]];
    [modelsTransformContent appendString:@"\n       [models addObject:model];"];
    [modelsTransformContent appendString:@"\n   }"];
    [modelsTransformContent appendString:@"\n   return models;"];
    [modelsTransformContent appendString:@"\n}"];
    NSLog(@"%@",modelsTransformContent);
}

-(void)produceModelTransformWithKeys:(NSArray *)keys andModelString:(NSString *)modelString{
    NSString *ModelString = [NSString stringWithFormat:@"%@Model",[modelString capitalizedString]];
    NSMutableString *modelTransformContent = [[NSMutableString alloc] init];
    [modelTransformContent appendString:[NSString stringWithFormat:@"\n-(%@ *)modelWithDict:(NSDictionary *)dict{",ModelString]];
    [modelTransformContent appendString:[NSString stringWithFormat:@"\n  %@ *model = [[%@ alloc] init];",ModelString,ModelString]];
    for (NSString *key in keys) {
        [modelTransformContent appendString:[NSString stringWithFormat:@"\n  model.%@ = [dict valueForKey:@\"%@\"];",key,key]];
    }
    [modelTransformContent appendString:@"\n  return model;"];
    [modelTransformContent appendString:@"\n}"];
    NSLog(@"%@",modelTransformContent);
}


@end
