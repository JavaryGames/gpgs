#include "GodotPlayGameServices.h"
#import "app_delegate.h"
#import "Reachability.h"

#if VERSION_MAJOR == 3
#define CLASS_DB ClassDB
#else
#define CLASS_DB ctTypeDB
#endif


GodotPlayGameServices::GodotPlayGameServices() {
}

GodotPlayGameServices::~GodotPlayGameServices() {
}


// Checks if we have an internet connection or not
void GodotPlayGameServices::startConnectionCallback(){
    Reachability *internetReachableFoo;
    internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];


    // Internet is reachable
    internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            Object *obj = ObjectDB::get_instance(callbackID);
            NSLog(@"Yayyy, we have the interwebs!");
            obj->call_deferred(String("update_connection_status"), [true]);
        });

    };

    // Internet is not reachable
    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            Object *obj = ObjectDB::get_instance(callbackID);
            NSLog(@"Someone broke the internet :(");
            obj->call_deferred(String("update_connection_status"), [false]);
        });
    };

    [internetReachableFoo startNotifier];
}

void GodotPlayGameServices::setConnectionCallbackId(int objId){
    NSLog(@"GodotPlayGameServices Module set callback obj");
    callbackID = objId;
}

void GodotPlayGameServices::isOnline() {
    NSLog(@"GodotPlayGameServices isOnline");
}

// void GodotRateIt::rate(const String &url_prefix, const String &url_prefix_fallback, const String &id_format, const String &app_id) {
//     do_ios_rate(app_id);
// }

// void GodotRateIt::do_ios_rate(const String &app_id) {
//     if (@available(iOS 10.3, *)) {
//         [SKStoreReviewController requestReview];
//         return;
//     }
//     NSString *str;
//     float ver = [[[UIDevice currentDevice] systemVersion] floatValue];
//     if (ver >= 7.0 && ver < 7.1) {
//         str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", &app_id];
//     } else if (ver >= 8.0) {
//         str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/Webcts/MZStore.woa/wa/viewContentsUserReviews?id=%@&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software", &app_id];
//     } else {
//         str = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/Webcts/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", &app_id];
//     }
//     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
// }

void GodotPlayGameServices::_bind_methods() {
    CLASS_DB::bind_method("startConnectionCallback", &GodotPlayGameServices::startConnectionCallback);
    CLASS_DB::bind_method("setConnectionCallbackId", &GodotPlayGameServices::setConnectionCallbackId);
    CLASS_DB::bind_method("isOnline", &GodotPlayGameServices::isOnline);
}
