import { LightningElement,wire }     from 'lwc';
import { getRecord, getFieldValue }  from 'lightning/uiRecordApi';
import { ShowToastEvent }            from 'lightning/platformShowToastEvent';
import { NavigationMixin }           from 'lightning/navigation';
import USER_ID                       from '@salesforce/user/Id';
import ACCOUNT_ID                    from '@salesforce/schema/User.Contact.Account.Id';
import CONTACT_ID                    from '@salesforce/schema/User.Contactid';
import USER_NAME                     from '@salesforce/schema/User.Name';  
import SUBJECT_FIELD                 from '@salesforce/schema/Case.Subject'
import CASE_OBJECT                   from '@salesforce/schema/Case'
import DESCRIPTION_FIELD             from '@salesforce/schema/Case.Description';
import LWC_TITLE                     from '@salesforce/label/c.LWCCaseCreateTitulo';
import LWC_SALVEBUTTON               from '@salesforce/label/c.LWCCaseCreateBotaoSalvar';

export default class CaseCreate extends NavigationMixin(LightningElement)  {
  
    // Variaveis
    objectApiName    = CASE_OBJECT;
    subjectField     = SUBJECT_FIELD;  
    descriptionField = DESCRIPTION_FIELD;
    
    lwcTitle         = LWC_TITLE;
    lwcsalvebutton   = LWC_SALVEBUTTON;
    
    // Recuperar os dados do usuário da pagina
    @wire(getRecord,{recordId: USER_ID, fields:[CONTACT_ID,USER_NAME],optionalFields: [ACCOUNT_ID]})
    user 

    //
    get contact(){
        return getFieldValue(this.user.data,CONTACT_ID);
    }

    get account(){
        return getFieldValue(this.user.data, ACCOUNT_ID);
    }



    handleReset(event) {

        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }

        console.log("Reniciano")
     }


    handleSave(event){
        console.log("Salvando")

        event.preventDefault();
        const siteCase     = event.detail.fields
        siteCase.status    = 'Novo'
        siteCase.Origin    = 'Portal do cliente'
        siteCase.AccountId = this.account
        siteCase.ContactId = this.contact
        
        this.template.querySelector('lightning-record-edit-form').submit(siteCase)

        this.handleReset()
    
        this.dispatchEvent(
            new ShowToastEvent({
            title: 'Caso salvo',
            message: 'O caso foi criado com sucesso',
            variant: 'success'})
        )

        
    }

    createSuccessToastEvent(event){

        console.log(event.detail.id);
        // to view a particular record.
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.detail.id,
                objectApiName: 'Case', // objectApiName is optional
                actionName: 'view'
            }
        });


    }

    
}

