public class UserSelector {

    public static User getCurrentUser() {
        return [SELECT Id, ContactId FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
    }
}