package lk.jiat.scm.ejb;

import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import lk.jiat.scm.core.exceptions.DuplicateEmailException;
import lk.jiat.scm.core.exceptions.InvalidCredentialException;
import lk.jiat.scm.core.service.UserBeanService;
import lk.jiat.scm.ejb.util.PasswordEncryptor;
import lk.jiat.scm.entities.entity.User;
import lk.jiat.scm.entities.entity.UserStatus;

import java.util.HashSet;
import java.util.Set;

@Stateless
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class UserBean implements UserBeanService {

    @PersistenceContext(unitName = "SCMPU")
    private EntityManager em;

    @Override
    public boolean registerUser(String firstName, String lastName, String email, String password, String status, String selectedRole)
            throws DuplicateEmailException {

        if (findByEmail(email) != null) {
            throw new DuplicateEmailException(email);
        }

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);

        user.setPassword(PasswordEncryptor.hashPassword(password));

        Set<String> rolesSet = new HashSet<>();
        rolesSet.add(selectedRole);
        user.setRoles(rolesSet);

        if ("CUSTOMER".equals(selectedRole)) {
            user.setUserStatus(UserStatus.APPROVED);
        } else {
            user.setUserStatus(UserStatus.PENDING);
        }

        em.persist(user);
        return true;
    }

    @Override
    public boolean login(String email, String password) throws InvalidCredentialException {
        User user = findByEmail(email);
        if (user == null) {
            throw new InvalidCredentialException("User not found with this email!");
        }

        if (!PasswordEncryptor.checkPassword(password, user.getPassword())) {
            throw new InvalidCredentialException("Invalid Password!");
        }

        return true;
    }

    @Override
    public User findByEmail(String email) {
        try {
            return em.createNamedQuery("User.findByEmail", User.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}