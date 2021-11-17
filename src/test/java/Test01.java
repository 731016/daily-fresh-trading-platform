import com.zr.enums.UserState;
import com.zr.mapper.UserMapper;
import com.zr.pojo.User;
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
}
