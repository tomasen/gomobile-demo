package org.tomasen.gopher.demo.gopherdemoandroid;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private Button btn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn = (Button)findViewById(R.id.button);


        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View arg0) {
                TextView text1 = (TextView)findViewById(R.id.textView);
                TextView text2 = (TextView)findViewById(R.id.textView2);

                text1.setText("This is a text1");
                text2.setText("This is a text2");
            }
        });
    }
}
