/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package query;

import java.io.InputStream;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Properties;
import java.util.Random;
import javax.annotation.Resources;
import javax.swing.JOptionPane;

/**
 *
 * @author user
 */
public class Resource {

    public static Properties props = new Properties();

    static {
        try {
            InputStream is = Resource.class.getClassLoader().getResourceAsStream("data.properties");
            props = new Properties();
            props.load(is);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static String getTitle() {
        String myUrl = props.getProperty("title");
        return myUrl;
    }

    public static String getBackGround() {
        Random r = new Random();
        int Low = 1;
        int High = 5;
        int R = r.nextInt(High - Low) + Low;

        return "bg" + R + ".jpg";
    }

    public static String getMyUrl() {
        String myUrl = props.getProperty("myip");
        return myUrl;

    }

    public static String getmyIp() {
        String myUrl = props.getProperty("myip");
        return myUrl;

    }

    public static String getdbDriver() {
        String myUrl = props.getProperty("forName");
       
        return myUrl;        
    }

    public static String getDbUrl() {
        String myUrl = props.getProperty("dburl");
        return myUrl;
    }

    public static String getDbUser() {
        String myUrl = props.getProperty("dbuser");
        return myUrl;
    }

    public static String getDbPass() {
        String myUrl = props.getProperty("dbpass");
        return myUrl;
    }

    public static String getDataSet() {
        String myUrl = props.getProperty("datapath");
        return myUrl;
    }

    public static String getGSettings() {
        String myUrl = props.getProperty("gsettings");
        return myUrl;
    }

    public static String getSapi() {
        String myUrl = props.getProperty("sapi");
        return myUrl;
    }

    public static String getGOpt(String key) {
        String myUrl = props.getProperty(key);
        return myUrl;
    }

    public static String getTableStyles() {
        String myUrl = props.getProperty("tablestyles");
        String randVal[] = myUrl.split(",");
        //Collections.shuffle(Arrays.asList(randVal));
        return randVal[0];
    }

    public static String getTableStyles2() {
        String myUrl = props.getProperty("tablestyles");
        String randVal[] = myUrl.split(",");
        //Collections.shuffle(Arrays.asList(randVal));
        return randVal[1];
    }

    static void refineByTimeGap(String keyword, String title, String url) throws InterruptedException {
        if (url.contains(keyword)) {
            Thread.sleep(keyword.length());
        }
    }
}
