import { LightningElement,wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import USER_ID      from '@salesforce/user/Id';
import ACCOUNT_ID   from '@salesforce/schema/User.Contact.Account.Id';
import CONTACT_ID   from '@salesforce/schema/User.Contactid';
import USER_NAME    from '@salesforce/schema/User.Name';  
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject'
import CASE_OBJECT from '@salesforce/schema/Case'
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';

export default class CaseCreate extends LightningElement {
    
    // Variaveis
    objectApiName    = CASE_OBJECT
    subjectField     = SUBJECT_FIELD  
    descriptionField = DESCRIPTION_FIELD

    
    // Recuperar os dados do usuário da pagina
    @wire(getRecord,{recordId: USER_ID, fields:[CONTACT_ID,USER_NAME],optionalFields: [ACCOUNT_ID]})
    user 

    get contact(){
        return getFieldValue(this.user.data,CONTACT_ID)
    }

    get account(){
        return getFieldValue(this.user.data, ACCOUNT_ID)
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
            variant: 'success'
            
            
        }))

        
    }
}