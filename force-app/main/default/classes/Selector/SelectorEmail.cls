public class SelectorEmail {

    public static EmailTemplate getEmailTemplate (){
        return [select id from EmailTemplate where developername='ModeloLeadAcompanhamento' Limit 1];
    }   
}