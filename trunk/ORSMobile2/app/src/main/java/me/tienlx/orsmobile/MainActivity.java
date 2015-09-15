package me.tienlx.orsmobile;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.webkit.JsPromptResult;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.EditText;
import android.widget.TextView;


public class MainActivity extends Activity {
    private WebView webView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        final Context mapp = this;
        setContentView(R.layout.activity_main);

        // get prompts.xml view
        LayoutInflater li = LayoutInflater.from(mapp);
        View promptsView = li.inflate(R.layout.javascript_prompt_dialog, null);

        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(mapp);

        // set prompts.xml to alertdialog builder
        alertDialogBuilder.setView(promptsView);

        final EditText userInput = (EditText) promptsView
                .findViewById(R.id.prompt_input_field);
        ((EditText)promptsView.findViewById(R.id.prompt_input_field)).setText("http://192.168.1.1:8080");

        // set dialog message
        alertDialogBuilder
                .setCancelable(false)
                .setPositiveButton("OK",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                // get user input and set it to result
                                // edit text
                                //result.setText(userInput.getText());
                                String url = userInput.getText().toString();
                                webView.loadUrl(url);
                            }
                        })
                .setNegativeButton("Cancel",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                finish();
                            }
                        });

        // create alert dialog
        AlertDialog alertDialog = alertDialogBuilder.create();

        // show it
        alertDialog.show();


        webView = (WebView) this.findViewById(R.id.webView);
        webView.setWebViewClient(new MyWebViewClient(this));
        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webView.addJavascriptInterface(new WebAppInterface(this), "Android");

        webView.setWebChromeClient(new WebChromeClient() {
            @Override
            public boolean onJsAlert(WebView view, String url, String message, final JsResult result)
            {
                new AlertDialog.Builder(MainActivity.this)
                        .setTitle("Office rental service")
                        .setMessage(message)
                        .setPositiveButton(android.R.string.ok,
                                new AlertDialog.OnClickListener()
                                {
                                    public void onClick(DialogInterface dialog, int which)
                                    {
                                        result.confirm();
                                    }
                                })
                        .setCancelable(false)
                        .create()
                        .show();

                return true;
            }
            @Override
            public boolean onJsPrompt(WebView view, String url, String message, String defaultValue, final JsPromptResult result)
            {
                final LayoutInflater factory = LayoutInflater.from(MainActivity.this);
                final View v = factory.inflate(R.layout.javascript_prompt_dialog, null);
                ((TextView)v.findViewById(R.id.prompt_message_text)).setText(message);
                ((EditText)v.findViewById(R.id.prompt_input_field)).setText(defaultValue);

                new AlertDialog.Builder(MainActivity.this)
                        .setTitle("Office rental service")
                        .setView(v)
                        .setPositiveButton(android.R.string.ok,
                                new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int whichButton) {
                                        String value = ((EditText)v.findViewById(R.id.prompt_input_field)).getText()
                                                .toString();
                                        result.confirm(value);
                                    }
                                })
                        .setNegativeButton(android.R.string.cancel,
                                new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int whichButton) {
                                        result.cancel();
                                    }
                                })
                        .setOnCancelListener(
                                new DialogInterface.OnCancelListener() {
                                    public void onCancel(DialogInterface dialog) {
                                        result.cancel();
                                    }
                                })
                        .show();

                return true;
            }
        });
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        // Check if the key event was the Back button and if there's history
        if ((keyCode == KeyEvent.KEYCODE_BACK) && webView.canGoBack()) {
            webView.goBack();
            return true;
        }
        // If it wasn't the Back key or there's no web page history, bubble up to the default
        // system behavior (probably exit the activity)
        return super.onKeyDown(keyCode, event);
    }
}
