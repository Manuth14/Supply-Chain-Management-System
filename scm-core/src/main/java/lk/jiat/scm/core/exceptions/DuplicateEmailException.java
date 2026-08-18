package lk.jiat.scm.core.exceptions;

import jakarta.ejb.ApplicationException;

@ApplicationException(rollback = true)
public class DuplicateEmailException extends Exception {
    public DuplicateEmailException(String email) {
        super("An account already exists with the email " + email);
    }
}
