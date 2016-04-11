package org.tomasen.gopher.demo.gopherdemoandroid;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.view.View;
import android.widget.TextView;

import go.GopherKit.GopherKit;

public class MainActivity extends AppCompatActivity {

    private Button btn;
    private TextView NanoTimerLabel;
    private TextView MessageLabel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        NanoTimerLabel = (TextView)findViewById(R.id.textView);
        MessageLabel = (TextView)findViewById(R.id.textView2);

        btn = (Button)findViewById(R.id.button);


        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View arg0) {

                GopherKit.RegisterCallback(new Callbacks());
                GopherKit.Start();

            }
        });
    }

    class Callbacks extends GopherKit.Callback.Stub {
        @Override
        public void StateDidUpdate() {
            MainActivity.this.runOnUiThread(new Runnable() {
                public void run() {
                    GopherKit.State state = GopherKit.GetState();
                    NanoTimerLabel.setText(String.valueOf(state.getNanoTimeStamp()));
                    if (state.getMessage().length() != 0 && MessageLabel.getText() != state.getMessage()) {
                        MessageLabel.setText(state.getMessage());
                    }
                }
            });
        }
    }

}
