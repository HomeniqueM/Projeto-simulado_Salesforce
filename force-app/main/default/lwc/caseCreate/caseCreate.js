import { LightningElement, track,wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import USER_ID      from '@salesforce/user/Id';
import ACCOUNT_ID   from '@salesforce/schema/User.Contact.Account.id';
import CONTACT_ID   from '@salesforce/schema/User.Contactid';
import USER_NAME    from '@salesforce/schema/User.Name';  

export default class CaseCreate extends LightningElement {
    @track visibility = false
    // Recuperar os dados do usuário da pagina
    @wire(getRecord,{recordId: USER_ID, fields:[CONTACT_ID,USER_NAME],optionalFields: [ACCOUNT_ID]})
    user 

    get contact(){
        return getFieldValue(this.user.data,CONTACT_ID)
    }

    get account(){
        return getFieldValue(this.user.data, ACCOUNT_ID)
    }

    resertFields(){
        const inputFields = this.template.querySelectorAll('lightning-input-field')
        if(inputFields){
            inputFields.forEach(field => {field.reset()                
            });
        }
    }

    handleClick(event){
        const label = event.target.label;
        if(label == 'Criar novo caso'){
            this.visibility = true
        }else if( label == 'Cancelar'){
            this.resertFields()
            this.visibility = false
        }
    }


    handleSave(event){
        event.preventDefault();
        const siteCase     = event.detail.fields
        siteCase.status    = 'Novo'
        siteCase.Origin    = 'Portal do cliente'
        siteCase.AccountId = this.account
        siteCase.ContactId = this.contact

        this.template.querySelector('lightning-input-field').submit(SiteCase)

        this.resertFields()
        this.visibility    = false

        this.dispatchEvent({
            title: 'Caso salvo',
            message: 'O caso foi criado com sucesso',
            veriant: 'Success'
        })
    }
}