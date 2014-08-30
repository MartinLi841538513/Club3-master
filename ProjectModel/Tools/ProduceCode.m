//
//  ProduceCode.m
//  Club
//
//  Created by dongway on 14-8-17.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "ProduceCode.h"

@implementation ProduceCode

-(void)produceCodeWithModelString:(NSString *)modelString andKeys:(NSArray *)keys{
    [self produceModelWithKeys:keys];
    [self produceUserCodeWithKeys:keys];
    [self produceDaoCodeWithModelString:modelString andKeys:keys];
    [self produceDispathLoadDataCodeWithModelString:modelString];
}

//Model code
-(void)produceModelWithKeys:(NSArray *)keys{
    
    NSLog(@"\n\n\nmodel====================================================================model");
    NSMutableString *modelContent = [[NSMutableString alloc] init];
    for (NSString *key in keys) {
        [modelContent appendString:[NSString stringWithFormat:@"\n@property (copy, nonatomic) NSString *%@;",key]];
    }
    NSLog(@"%@",modelContent);
}

//UserModel code
-(void)produceUserCodeWithKeys:(NSArray *)keys{
    NSLog(@"\n\n\nUserModel====================================================================UserModel");
    NSMutableString *modelContent = [[NSMutableString alloc] init];
    [modelContent appendString:@"\n- (void)encodeWithCoder:(NSCoder *)encoder {"];
    for (NSString *key in keys) {
        [modelContent appendString:[NSString stringWithFormat:@"\n [encoder encodeObject:self.%@ forKey:@\"%@\"];",key,key]];
    }
    [modelContent appendString:@"\n}\n\n"];
    
    [modelContent appendString:@"\n- (id)initWithCoder:(NSCoder *)decoder {"];
    [modelContent appendString:@"\n if((self = [super init])) {"];
    for (NSString *key in keys) {
        [modelContent appendString:[NSString stringWithFormat:@"\n  self.%@ = [decoder decodeObjectForKey:@\"%@\"];",key,key]];
    }
    [modelContent appendString:@"\n }"];
    [modelContent appendString:@"\n return self;"];
    [modelContent appendString:@"\n}"];
    NSLog(@"%@",modelContent);
}

//ModelDao code

-(void)produceDaoCodeWithModelString:(NSString *)modelString andKeys:(NSArray *)keys{
    NSLog(@"\n\n\nmodelDao====================================================================modelDao");
    NSString *string1 = [self produceRequestFeedBackCodeStringWithModelString:modelString];
    NSString *string2 = [self produceModelsTransformWithModelString:modelString];
    NSString *string3 = [self produceModelTransformWithKeys:keys andModelString:modelString];
    NSString *string = [NSString stringWithFormat:@"%@%@%@",string1,string2,string3];
    NSLog(@"%@",string);
}
//loaddata返回判断
-(NSString *)produceRequestFeedBackCodeStringWithModelString:(NSString *)modelString{
    
    NSString *ModelString = [NSString stringWithFormat:@"%@",[modelString capitalizedString]];//首字母大写
    NSMutableString *modelsTransformContent = [[NSMutableString alloc] init];
    
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n#import \"%@Dao.h\"",ModelString]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n#import \"InternetRequest.h\""]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n@implementation %@Dao\n",ModelString]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n-(%@Model *)%@With{",ModelString,modelString]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n    NSString *urlString = [NSString stringWithFormat:%@URL];",ModelString]];
    [modelsTransformContent appendString:@"\n   NSDictionary *result = [InternetRequest loadDataWithUrlString:urlString];"];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n    %@ *model = [[%@ alloc] init];",ModelString,ModelString]];
    [modelsTransformContent appendString:@"\n   NSNumber *status = (NSNumber *)[result objectForKey:@\"status\"];"];
    [modelsTransformContent appendString:@"\n   if ([status isEqual:[NSNumber numberWithInt:2]]) {"];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n    NSDictionary *dict = [result objectForKey:@\"info\"];"]];
    [modelsTransformContent appendString:@"\n       model = [self modelWithDict:dict];"];
    [modelsTransformContent appendString:@"\n       return model;"];
    [modelsTransformContent appendString:@"\n   }else{"];
    [modelsTransformContent appendString:@"\n       return nil;"];
    [modelsTransformContent appendString:@"\n   }"];
    [modelsTransformContent appendString:@"\n}\n\n"];

    return modelsTransformContent;
}

//dicts转化成models
-(NSString *)produceModelsTransformWithModelString:(NSString *)modelString{
    NSString *ModelString = [NSString stringWithFormat:@"%@Model",[modelString capitalizedString]];//首字母大写
    NSMutableString *modelsTransformContent = [[NSMutableString alloc] init];
    [modelsTransformContent appendString:@"\n-(NSArray *)modelsWithDicts:(NSArray *)dicts{"];
    [modelsTransformContent appendString:@"\n   NSMutableArray *models = [[NSMutableArray alloc] init];"];
    [modelsTransformContent appendString:@"\n   for(NSDictionary *dict in dicts){"];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n        %@ *model = [self modelWithDict:dict];",ModelString]];
    [modelsTransformContent appendString:@"\n       [models addObject:model];"];
    [modelsTransformContent appendString:@"\n   }"];
    [modelsTransformContent appendString:@"\n   return models;"];
    [modelsTransformContent appendString:@"\n}\n\n"];
    return modelsTransformContent;
    
}

//dict转化成model
-(NSString *)produceModelTransformWithKeys:(NSArray *)keys andModelString:(NSString *)modelString{
    NSString *ModelString = [NSString stringWithFormat:@"%@Model",[modelString capitalizedString]];
    NSMutableString *modelTransformContent = [[NSMutableString alloc] init];
    [modelTransformContent appendString:[NSString stringWithFormat:@"\n-(%@ *)modelWithDict:(NSDictionary *)dict{",ModelString]];
    [modelTransformContent appendString:[NSString stringWithFormat:@"\n  %@ *model = [[%@ alloc] init];",ModelString,ModelString]];
    for (NSString *key in keys) {
        [modelTransformContent appendString:[NSString stringWithFormat:@"\n  model.%@ = [dict valueForKey:@\"%@\"];",key,key]];
    }
    [modelTransformContent appendString:@"\n  return model;"];
    [modelTransformContent appendString:@"\n}\n"];
    return modelTransformContent;
    
}



//ModelService  Code
//loadData提示
-(void)produceDispathLoadDataCodeWithModelString:(NSString *)modelString{
    NSLog(@"\n\n\n modelService====================================================================modelService");
    
    NSString *ModelString = [NSString stringWithFormat:@"%@",[modelString capitalizedString]];//首字母大写
    NSMutableString *modelsTransformContent = [[NSMutableString alloc] init];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n#import \"%@Service.h\"",ModelString]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n#import \"SVProgressHUD.h\""]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n#import \"%@Model.h\"",ModelString]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n#import \"%@Dao.h\"",ModelString]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n@implementation %@Service\n",ModelString]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n-(void)%@With{",modelString]];

    [modelsTransformContent appendString:@"\n\n [SVProgressHUD show];"];
    [modelsTransformContent appendString:@"\n   dispatch_async(dispatch_get_global_queue(0, 0), ^{"];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n        %@Dao *%@dao = [[%@Dao alloc] init];",ModelString,modelString,ModelString]];
    [modelsTransformContent appendString:[NSString stringWithFormat:@"\n        %@Model *model = [%@dao",ModelString,modelString]];
    [modelsTransformContent appendString:@"\n       dispatch_sync(dispatch_get_main_queue(), ^{"];
    [modelsTransformContent appendString:@"\n           if (model==nil) {"];
    [modelsTransformContent appendString:@"\n               [SVProgressHUD showErrorWithStatus:@\"失败\"];"];
    [modelsTransformContent appendString:@"\n           }else{"];
    [modelsTransformContent appendString:@"\n               [SVProgressHUD showErrorWithStatus:@\"成功\"];"];
    [modelsTransformContent appendString:@"\n           }"];
    [modelsTransformContent appendString:@"\n       });"];
    [modelsTransformContent appendString:@"\n   });"];
    [modelsTransformContent appendString:@"\n}\n"];

    NSLog(@"%@",modelsTransformContent);
}

@end
