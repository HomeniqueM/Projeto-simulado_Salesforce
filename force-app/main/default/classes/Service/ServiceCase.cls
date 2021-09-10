public class ServiceCase {

    public static void iniciarTempoDeAtendimento( List <Case> listCase){
        Set<Id> contactIds = new Set<Id>();
        Set<Id> acctIds = new Set<Id>();
        
        for (Case c : listCase) {
            contactIds.add(c.ContactId);
            acctIds.add(c.AccountId); 
        }

        List <EntitlementContact> entlContacts =
        [Select e.EntitlementId,e.ContactId,e.Entitlement.AssetId
        From EntitlementContact e
        Where e.ContactId in :contactIds
        And e.Entitlement.EndDate >= Today
        And e.Entitlement.StartDate <= Today];

    }

}