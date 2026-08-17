package lk.jiat.scm.core.service;

import jakarta.ejb.Local;
import lk.jiat.scm.core.exceptions.DuplicateEmailException;
import lk.jiat.scm.core.exceptions.InvalidCredentialException;
import lk.jiat.scm.entities.entity.User;

@Local
public interface UserBeanService {
    boolean registerUser(String firstName, String lastName, String email, String password,String status, String selectedRole) throws DuplicateEmailException;
    boolean login(String email, String password) throws InvalidCredentialException;
    User findByEmail(String email);
}
