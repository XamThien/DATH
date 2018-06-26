/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.PgUsers;

/**
 *
 * @author dangt
 */
public class PGValidation {

    public boolean checkMail(String email) {
        Matcher matcher = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE).matcher(email);
        return matcher.find();
    }

    public boolean checkUsername(String username) {
        Matcher matcher = Pattern.compile("^[a-zA-Z0-9]{6,}$").matcher(username);
        return matcher.find();
    }

    public boolean checkPhone(String phone) {
        Matcher matcher = Pattern.compile("^\\+{0,1}[0-9]{9,12}$").matcher(phone);
        return matcher.find();
    }

    public boolean check(String str) {
        return !str.isEmpty();
    }

    public boolean checkSignupPassword(String password) {
        return !(password.length() < 6);
    }

    public String validateUserInformation(PgUsers user, String cfpass) {
        PGValidation validation = new PGValidation();
        if (!validation.check(user.getFirstName())) {
            return "Fist name is empty.";
        }else if(!validation.check(user.getLastName())){
            return "Last name is empty.";
        }
        else if (!validation.checkUsername(user.getUserId())) {
            return "Username khong de trong hoac duoi 6 ki tu hoac khong hop le.";
        } else if (!validation.checkMail(user.getEmail()) && !user.getEmail().isEmpty()) {
            return "Email khong hop le";
        } else if (!validation.checkPhone(user.getPhoneNumber())) {
            return "So dien thoai khong duoc de trong hoac khong hop le.";
        } else if (!validation.check(user.getAddress())) {
            return "Dia chi can thiet cho viec giao hang";
        } else if (!validation.checkSignupPassword(user.getUserPassword())) {
            return "Mat khau khong duoc de trong hoac duoi 6 ki tu";
        } else if (!user.getUserPassword().equals(cfpass)) {
            return "Mat khau khong khop";
        }
        if(!user.getCardId().equals("")){
            if(!validation.checkPhone(user.getCardId())){
                return "CardId khong hop le";
            }
        }
        return "valid";
    }
}
