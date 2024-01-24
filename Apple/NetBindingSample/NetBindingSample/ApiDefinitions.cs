using System;
using Foundation;
using NativeBindingSample;
using UIKit;

namespace NativeBindingSample
{
	// @interface NativeAlertService : NSObject
	[BaseType (typeof(NSObject), Name = "_TtC19NativeBindingSample18NativeAlertService")]
	interface NativeAlertService
	{
		// -(void)showAlertWithViewController:(UIViewController * _Nonnull)viewController request:(ShowAlertRequest * _Nonnull)request animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;
		[Export ("showAlertWithViewController:request:animated:completion:")]
		void ShowAlertWithViewController (UIViewController viewController, ShowAlertRequest request, bool animated, [NullAllowed] Action completion);
	}

	// @interface ShowAlertRequest : NSObject
	[BaseType (typeof(NSObject), Name = "_TtC19NativeBindingSample16ShowAlertRequest")]
	interface ShowAlertRequest
	{
		// @property (copy, nonatomic) NSString * _Nonnull title;
		[Export ("title")]
		string Title { get; set; }

		// @property (copy, nonatomic) NSString * _Nonnull message;
		[Export ("message")]
		string Message { get; set; }

		// @property (copy, nonatomic) NSString * _Nonnull buttonCaption;
		[Export ("buttonCaption")]
		string ButtonCaption { get; set; }
	}
}
