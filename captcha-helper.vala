using Gtk;
using WebKit;

public class ValaBrowser : Window {

    private const string TITLE = "Signal Captcha Helper";
    private const string DEFAULT_URL = "https://signalcaptchas.org/registration/generate.html";

    private WebView web_view;

    public ValaBrowser () {
        this.title = ValaBrowser.TITLE;
        set_default_size (450, 600);

        this.web_view = new WebView ();
        this.web_view.web_context.register_uri_scheme("signalcaptcha", token_issued);
        var scrolled_window = new ScrolledWindow (null, null);
        scrolled_window.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
        scrolled_window.add (this.web_view);
        add (scrolled_window);

        this.destroy.connect (Gtk.main_quit);
    }

    private void token_issued(URISchemeRequest request) {
      print(request.get_uri().substring(16) + "\n");
      Gtk.main_quit();
    }

    public void start () {
        show_all ();
        this.web_view.load_uri (DEFAULT_URL);
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var browser = new ValaBrowser ();
        browser.start();

        Gtk.main ();

        return 0;
    }
}
