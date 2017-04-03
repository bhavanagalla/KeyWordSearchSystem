/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package query;

/**
 *
 * @author user
 */
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
public class EmailValidator {

    public static boolean isValidEmailAddress(String email) {
        try {
            new InternetAddress(email).validate();
        } catch (AddressException ex) {
            return false;
        }
        return true;
    }
}