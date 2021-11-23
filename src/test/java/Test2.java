import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import com.zr.mapper.HistoryMapper;
import com.zr.pojo.Goods;
import com.zr.pojo.GoodsOrder;
import com.zr.pojo.GoodsOrderVo;
import com.zr.pojo.History;
import com.zr.result.Result;
import com.zr.service.GoodsService;
import com.zr.service.HistoryService;
import com.zr.service.OrderService;
import com.zr.service.ShoppingCartService;
import com.zr.service.impl.HistoryServiceImpl;
import com.zr.web.HistoryController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test2 {
    @Resource
    private OrderService orderService;

    @Resource
    private GoodsService goodsService;

    @Resource
    private ShoppingCartService cartService;

    @Resource
    private HistoryService historyService;

    @Test
    public void Demo1() {
        QueryWrapper<GoodsOrder> wrapper = new QueryWrapper<>();
        String account = "admin";
        wrapper.eq("account", account);
        PageInfo<GoodsOrderVo> orderPageInfo = orderService.selectPage(account, 1, 5);
        System.out.println(orderPageInfo.getList());
    }

}
