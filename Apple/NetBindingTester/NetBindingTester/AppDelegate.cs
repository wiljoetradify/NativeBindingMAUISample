using NativeBindingSample;

namespace NetBindingTester;

[Register ("AppDelegate")]
public class AppDelegate : UIApplicationDelegate {
    public override UIWindow? Window {
        get;
        set;
    }

    public override bool FinishedLaunching (UIApplication application, NSDictionary launchOptions)
    {
        // create a new window instance based on the screen size
        Window = new UIWindow (UIScreen.MainScreen.Bounds);

        // create a UIViewController with a single UILabel
        var vc = new UIViewController ();
        vc.View!.BackgroundColor = UIColor.SystemBackground;
        var button = new UIButton(Window!.Frame);
        button.SetTitle("Hello, iOS!", UIControlState.Normal);
        button.TouchUpInside += (object? sender, EventArgs e) =>
        {
            var service = new NativeAlertService();
            service.ShowAlertWithViewController(vc, new ShowAlertRequest
            {
                Title = "Title Test",
                Message = "Message Test",
                ButtonCaption = "OK Test"
            }, true, null);
        };
        vc.View!.AddSubview (button);
        Window.RootViewController = vc;

        // make the window visible
        Window.MakeKeyAndVisible ();

        return true;
    }
}

