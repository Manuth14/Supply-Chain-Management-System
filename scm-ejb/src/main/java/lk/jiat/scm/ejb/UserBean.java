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

import java.util.HashSet;
import java.util.Set;

@Stateless
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class UserBean implements UserBeanService {

    @PersistenceContext(unitName = "SCMPU")
    private EntityManager em;

    @Override
    public boolean registerUser(String firstName, String lastName, String email, String password, String selectedRole)
            throws DuplicateEmailException {

        // 1. මේ ඊමේල් එකෙන් යුසර් කෙනෙක් දැනටමත් ඉන්නවදැයි පරීක්ෂා කිරීම (findByEmail භාවිතයෙන්)
        if (findByEmail(email) != null) {
            throw new DuplicateEmailException(email);
        }

        // 2. User object එක සකස් කිරීම
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);

        // 3. පාස්වර්ඩ් එක BCrypt මඟින් Hash කර සෙට් කිරීම
        user.setPassword(PasswordEncryptor.hashPassword(password));

        // 4. Role එක Set කිරීම
        Set<String> rolesSet = new HashSet<>();
        rolesSet.add(selectedRole);
        user.setRoles(rolesSet);

        // 5. ඩේටාබේස් එකට ඇතුළත් කිරීම
        em.persist(user);
        return true;
    }

    @Override
    public boolean login(String email, String password) throws InvalidCredentialException {
        // 1. ඊමේල් එක මඟින් යුසර් කෙනෙක් ලබා ගැනීම
        User user = findByEmail(email);
        if (user == null) {
            throw new InvalidCredentialException("User not found with this email!");
        }

        // 2. පාස්වර්ඩ් එක නිවැරදි දැයි පරීක්ෂා කිරීම
        if (!PasswordEncryptor.checkPassword(password, user.getPassword())) {
            throw new InvalidCredentialException("Invalid Password!");
        }

        return true; // ලොගින් වීම සාර්ථකයි
    }

    @Override
    public User findByEmail(String email) {
        try {
            return em.createNamedQuery("User.findByEmail", User.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null; // යුසර් කෙනෙක් නොමැති නම් null රිටර්න් කරයි
        }
    }
}