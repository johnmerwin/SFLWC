public class AccountRevenueAction {
    
    @InvocableMethod
    public static List<Decimal> getAccountRevenue(List<Id> ids) {
        
        List<Opportunity> lstOpps = [SELECT AccountId, Amount FROM Opportunity WHERE Id =: ids[0]];
        List<Account> lstAccts = [SELECT AnnualRevenue FROM Account WHERE Id =: lstOpps[0].AccountId];
        
        List<Decimal> annualRev = new List<Decimal>();
        
        lstAccts[0].AnnualRevenue += lstOpps[0].Amount;
        update lstAccts;
        
        annualRev.add(lstAccts[0].AnnualRevenue);
        return annualRev;
    }

}