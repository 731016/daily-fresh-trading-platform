import com.zr.enums.UserState;
import com.zr.mapper.UserMapper;
import com.zr.pojo.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.junit.experimental.theories.suppliers.TestedOn;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test01 {
    @Resource
    private UserMapper mapper;
    @Test
    public void Demo1() {
        UserState state = UserState.getUserStateByValue(1);
        System.out.println(state.getName());
    }
    @Test
    public void test1(){
        User user = new User();
        user.setAccount("zhangsan");
        user.setPwd("aaaaa");
        mapper.insert(user);
    }
    @Test
    public void test2() {
        System.out.println(DigestUtils.md5Hex("abc123"));
        System.out.println(DigestUtils.md5Hex("abc123456"));
        System.out.println(DigestUtils.md5Hex("abc12345"));
//        e99a18c428cb38d5f260853678922e03
    }
}
