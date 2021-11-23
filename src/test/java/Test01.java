import com.zr.enums.UserState;
import com.zr.mapper.ShoppingCartMapper;
import com.zr.mapper.UserMapper;
import com.zr.pojo.CartVo;
import com.zr.pojo.GoodsOrder;
import com.zr.pojo.User;
import com.zr.service.impl.SynOrder;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test01 {
    @Resource
    private UserMapper mapper;

    @Resource
    private ShoppingCartMapper shoppingCartMapper;

    @Resource
    private SynOrder order;

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

    @Test
    public void test3() {
        List<CartVo> admin = shoppingCartMapper.showCart("admin");
        for (CartVo cartVo : admin) {
            System.out.println(cartVo);
        }
    }

    @Test
    public void test4() throws InterruptedException {
        GoodsOrder goodsOrder=new GoodsOrder(null,"admin",1,300,new Date(),1200.00);
        new Thread(() -> {
            try {
                System.out.println("线程1："+order.synAddOrder(goodsOrder));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();

        new Thread(() -> {
            try {
                System.out.println("线程2："+order.synAddOrder(goodsOrder));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();
        Thread.sleep(3000);
    }
}
