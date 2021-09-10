public class SelectorEntitlement {

    public static Entitlement getTemplate(String template){
        return [Select id From Entitlement Where Name =: template];
         
    }
}