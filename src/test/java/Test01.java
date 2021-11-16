import com.zr.enums.UserState;
import org.junit.Test;
import org.junit.experimental.theories.suppliers.TestedOn;


public class Test01 {
    @Test
    public void Demo1() {
        UserState state = UserState.getUserStateByValue(1);
        System.out.println(state.getName());
    }
}
