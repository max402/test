import lombok.Data;

/**
 * This is class
 */
@Data
public class Class {
    String field1;
    String field2;
    /**
     * method a
     * @return string a
     */
    public String returnString() {
        return "a";
    }
}
