package me.tienlx.orsmobile;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;


/**
 * Created by ASUS on 7/20/2015.
 */
public class MyWebViewClient extends WebViewClient {
    private Context context;
    public MyWebViewClient(Context context) {
        this.context = context;
    }

    @Override
    public boolean shouldOverrideUrlLoading(WebView view, String url) {
        if (Uri.parse(url).getHost() != null && Uri.parse(url).getHost().equals("tienlx.me")) {
            return false;
        } else {
            Intent searchAddress = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            context.startActivity(searchAddress);
            return true;
        }
    }

    @Override
    public void onPageFinished(WebView view, String url) {
        //hide loading image
        ((Activity)context).findViewById(R.id.imageView).setVisibility(View.GONE);
        ((Activity)context).findViewById(R.id.textView).setVisibility(View.GONE);
        //show webview
        ((Activity)context).findViewById(R.id.webView).setVisibility(View.VISIBLE);
    }
}