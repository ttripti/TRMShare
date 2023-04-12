import { AfterViewInit, Component, ElementRef, OnInit, TemplateRef, ViewChild } from '@angular/core';
import {BlobServiceClient,AnonymousCredential,newPipeline } from '@azure/storage-blob';
import { environment } from '../../environments/environment';
import * as CryptoJS from 'crypto-js';
import {FormBuilder, Validators, FormControl, FormGroup} from '@angular/forms';
import {BreakpointObserver} from '@angular/cdk/layout';
import {StepperOrientation} from '@angular/material/stepper';
import {Observable} from 'rxjs';
import {map} from 'rxjs/operators';
import {FloatLabelType} from '@angular/material/form-field';
import { ShowHideDirective } from '@angular/flex-layout';
import { _isTestEnvironment } from '@angular/cdk/platform';
import { isDevMode } from '@angular/core';
import { AccountService } from '../Services/account.service';
import { IUser } from '../utilis/i-environment';
import {ApirequestService} from '../Services/apirequest.service';
import {RequestapiService } from '../Services/requestapi.service';
import {MatDialog} from '@angular/material/dialog';
import {DatePipe} from '@angular/common';
import { MatStepper } from '@angular/material/stepper';
import { MatSnackBar } from '@angular/material/snack-bar';
declare const isPDF: any;
@Component({
  selector: 'app-requestaccessto-api',
  templateUrl: './requestaccessto-api.component.html',
  styleUrls: ['./requestaccessto-api.component.css']
})
export class RequestaccesstoAPIComponent implements OnInit {

   @ViewChild("fileUpload",{static:false}) fileUpload :ElementRef;
   @ViewChild("fileUpButton",{static:false}) fileUpButton :ElementRef;
   @ViewChild("dropzone",{static:false}) dropzone :ElementRef;
   @ViewChild("DDClick",{static:false}) DDClick :ElementRef;
   @ViewChild("beingUploaded",{static:false}) beingUploaded :ElementRef;
   @ViewChild("removeButton",{static:false}) removeButton :ElementRef;
   
   isdevenvironment = isDevMode();

   @ViewChild("SuccessDialog") successDialog: TemplateRef<any>;
   selectedfile : any;
   currentFile : any;
   isShown: boolean = false;
   user:IUser;
   public fg:FormGroup;
   public firstFormGroup:FormGroup;
   public secondFormGroup: FormGroup;
   public thirdFormGroup: FormGroup;
   isRequestSubmitted:boolean;
   VAEmailAddress:string;
   SelectedValueReqWillOtherTeams:string;
  // reqApiService:RequestapiService;
  //  firstFormGroup = this._formBuilder.group({
  //   firstCtrl: ['', Validators.required],
  // });
  // secondFormGroup = this._formBuilder.group({
  //   secondCtrl: ['', Validators.required],
  // });
  // thirdFormGroup = this._formBuilder.group({
  //   thirdCtrl: ['', Validators.required],
  // });
  stepperOrientation: Observable<StepperOrientation>;

  constructor(private _formBuilder: FormBuilder, 
    breakpointObserver: BreakpointObserver,
   private accountService : AccountService,
   private _reqApiService: RequestapiService,
   private _snackbar : MatSnackBar,
   public dialog:MatDialog)
    {
    this.stepperOrientation = breakpointObserver
      .observe('(min-width: 650px)')
      .pipe(map(({matches}) => (matches ? 'horizontal' : 'vertical')));
     
      accountService.get().subscribe(data => {
     
        this.user = data;
        var currDate = new Date();
        var datePipe = new DatePipe("en-US");
        this.VAEmailAddress =this.user.email;
        this.firstFormGroup.controls['ReqName'].setValue(this.user.username);
        this.firstFormGroup.controls['ReqVAEmail'].setValue(this.user.email);
        this.firstFormGroup.controls['ReqPhoneNo'].setValue(this.user.phoneNo);
        this.firstFormGroup.controls['Date'].setValue(datePipe.transform(currDate, 'MM/dd/yyyy'));

        this.firstFormGroup.controls['ReqName'].disable();
        this.firstFormGroup.controls['ReqVAEmail'].disable();
        this.firstFormGroup.controls['Date'].disable();

        this.thirdFormGroup.controls['ReqName'].setValue(this.user.username);
        this.thirdFormGroup.controls['ReqVAEmail'].setValue(this.user.email);
        this.thirdFormGroup.controls['ReqPhoneNo'].setValue(this.user.phoneNo);
        this.thirdFormGroup.controls['Date'].setValue(datePipe.transform(currDate, 'MM/dd/yyyy'));

        this.thirdFormGroup.controls['ReqName'].disable();
        this.thirdFormGroup.controls['ReqVAEmail'].disable();
        this.thirdFormGroup.controls['Date'].disable();

      });
      this.SelectedValueReqWillOtherTeams="0";
      
     

      _reqApiService.index().subscribe();
      this.isRequestSubmitted=false;
  }

ngOnInit(): void {
  this.buildForm();
}
numberOnly(event:any):boolean{
  const charCode = (event.which) ? event.which : event.keyCode;
  if(charCode > 31 && (charCode < 48 || charCode > 57))
  {
    return false;
  }
  return true;
}

get VASIID() { 
  return this.firstFormGroup.get('VASIID'); 
}
validateVASI(event):any{
  this.firstFormGroup.get('VASIID').markAsTouched();
  this.thirdFormGroup.get('VASIID').markAsTouched();
  if(this.firstFormGroup.get('VASIID').invalid==true)
  {
    this.firstFormGroup.get('VASIID').invalid==true;   
  }
  else if (this.thirdFormGroup.get('VASIID').invalid==true)
  {
    this.thirdFormGroup.get('VASIID').invalid==true;   
  }
}
private buildForm(){
this.firstFormGroup =this._formBuilder.group({
  ReqName :['', Validators.required],
  ReqVAEmail:['', Validators.required],
  ReqPhoneNo:['', Validators.required],
  ProjectName:['', Validators.required],
  VASIID:['',[Validators.required,Validators.pattern('^[0-9]*$')] ],
  Date:['', Validators.required],
  OrgName:['', Validators.required],
  ReqRole:['', Validators.required],
  SystemName:['', Validators.required],
  SystemOwner:['', Validators.required],
  ISO:['', Validators.required]
});

this.secondFormGroup =this._formBuilder.group({
  ReqPurpose :['', Validators.required],
  ReqWhatValueToAnticipate:['', Validators.required],
  ReqHowManyTech:['', Validators.required],
  ReqHowPlannedUsage:['', Validators.required],
  ReqWillOtherTeams:['', Validators.required],
  ReqWhichTeams:['', Validators.required],
 
});

this.thirdFormGroup =this._formBuilder.group({
  ReqName :['', Validators.required],
  ReqVAEmail:['', Validators.required],
  ReqPhoneNo:['', Validators.required],
  ProjectName:['', Validators.required],
  VASIID:['',[Validators.required,Validators.pattern('^[0-9]*$')] ],
  Date:['', Validators.required],
  OrgName:['', Validators.required],
  ReqRole:['', Validators.required],
  SystemName:['', Validators.required],
  SystemOwner:['', Validators.required],
  ISO:['', Validators.required],
  ReqPurpose :['', Validators.required],
  ReqWhatValueToAnticipate:['', Validators.required],
  ReqHowManyTech:['', Validators.required],
  ReqHowPlannedUsage:['', Validators.required],
  ReqWillOtherTeams:['', Validators.required],
  ReqWhichTeams:['', Validators.required],
});




}


ngAfterViewInit(): void {
  
}
bgColor : string = 'whitesmoke';
fileSelected: string ='afilename';
showDiv1 = true;
showDiv2 = false;

changeColor(bgColor){
    this.bgColor = bgColor;
}

toggleShown(hideORshow: boolean) {
  //console.log("toggleShow beingUpLoaded: " + this.beingUploaded.nativeElement.hidden + " & removeButton: " + this.removeButton.nativeElement.hidden+ " changing to: " + hideORshow)
  //this.beingUploaded.nativeElement.hidden = hideORshow;
  //this.removeButton.nativeElement.hidden = hideORshow;
  //console.log("visible: " + this.removeButton.nativeElement.visible);
 if(hideORshow==true)
 {
  this.allFiles =[];
  this.fileUpload.nativeElement.value='';
 } 
  this.showDiv1 = hideORshow;
  this.showDiv2 = !hideORshow;
  if (this.showDiv1) (this.changeColor("whitesmoke"));
  console.log("hideOrShow firstDIV: "+this.showDiv1+ " secondDIV: "+this.showDiv2)
}

// copydataContinue(stepper: MatStepper,event){
//   debugger;
//   this.copydata(event);
//   stepper.next();

// }

CopyToThirdTab(fieldName ,event) {
  var val = event.target.value;
  if(fieldName =='ProjectName')
    this.thirdFormGroup.controls['ProjectName'].setValue(val);
  else if (fieldName =='ReqPhoneNo')
    this.thirdFormGroup.controls['ReqPhoneNo'].setValue(val);
  else if (fieldName =='VASIID')
    this.thirdFormGroup.controls['VASIID'].setValue(val);
  else if (fieldName =='Date')
    this.thirdFormGroup.controls['Date'].setValue(val);
  else if (fieldName =='OrgName')
    this.thirdFormGroup.controls['OrgName'].setValue(val);
  else if (fieldName =='ReqRole')
    this.thirdFormGroup.controls['ReqRole'].setValue(val);
  else if (fieldName =='SystemName')
    this.thirdFormGroup.controls['SystemName'].setValue(val);
    else if (fieldName =='SystemOwner')
    this.thirdFormGroup.controls['SystemOwner'].setValue(val);
    else if (fieldName =='ISO')
    this.thirdFormGroup.controls['ISO'].setValue(val);
    else if (fieldName =='ReqPurpose')
    this.thirdFormGroup.controls['ReqPurpose'].setValue(val);
    else if (fieldName =='ReqWhatValueToAnticipate')
    this.thirdFormGroup.controls['ReqWhatValueToAnticipate'].setValue(val);
    else if (fieldName =='ReqHowManyTech')
    this.thirdFormGroup.controls['ReqHowManyTech'].setValue(val);
    else if (fieldName =='ReqHowPlannedUsage')
    this.thirdFormGroup.controls['ReqHowPlannedUsage'].setValue(val);
    else if (fieldName =='ReqWhichTeams')
    this.thirdFormGroup.controls['ReqWhichTeams'].setValue(val);

}


CopyToFirstAndSecondTab(fieldName ,event) {
  var val = event.target.value;
  if(fieldName =='ProjectName')
    this.firstFormGroup.controls['ProjectName'].setValue(val);
  else  if(fieldName =='ReqPhoneNo')
    this.firstFormGroup.controls['ReqPhoneNo'].setValue(val);
  else if (fieldName =='VASIID')
    this.firstFormGroup.controls['VASIID'].setValue(val);
  else if (fieldName =='Date')
    this.firstFormGroup.controls['Date'].setValue(val);
  else if (fieldName =='OrgName')
    this.firstFormGroup.controls['OrgName'].setValue(val);
  else if (fieldName =='ReqRole')
    this.firstFormGroup.controls['ReqRole'].setValue(val);
  else if (fieldName =='SystemName')
    this.firstFormGroup.controls['SystemName'].setValue(val);
 
    else if (fieldName =='SystemOwner')
    this.firstFormGroup.controls['SystemOwner'].setValue(val);
    else if (fieldName =='ISO')
    this.firstFormGroup.controls['ISO'].setValue(val);
    else if (fieldName =='ReqPurpose')
    this.secondFormGroup.controls['ReqPurpose'].setValue(val);
    else if (fieldName =='ReqWhatValueToAnticipate')
    this.secondFormGroup.controls['ReqWhatValueToAnticipate'].setValue(val);
    else if (fieldName =='ReqHowManyTech')
    this.secondFormGroup.controls['ReqHowManyTech'].setValue(val);
    else if (fieldName =='ReqHowPlannedUsage')
    this.secondFormGroup.controls['ReqHowPlannedUsage'].setValue(val);
    else if (fieldName =='ReqWhichTeams')
    this.secondFormGroup.controls['ReqWhichTeams'].setValue(val);

}



// copydata(event)
// {
//   debugger;
//   var selectedIndex = event;
// if(event == 2)
// {
//   this.thirdFormGroup.controls['ReqName'].setValue(this.firstFormGroup.controls['ReqName'].getRawValue());
//   this.thirdFormGroup.controls['ReqVAEmail'].setValue(this.firstFormGroup.controls['ReqVAEmail'].getRawValue());
//   this.thirdFormGroup.controls['ReqPhoneNo'].setValue(this.firstFormGroup.controls['ReqPhoneNo'].getRawValue());

//   this.thirdFormGroup.controls['ProjectName'].setValue(this.firstFormGroup.controls['ProjectName'].getRawValue());
//   this.thirdFormGroup.controls['VASIID'].setValue(this.firstFormGroup.controls['VASIID'].getRawValue());
//   this.thirdFormGroup.controls['Date'].setValue(this.firstFormGroup.controls['Date'].getRawValue());
//   this.thirdFormGroup.controls['OrgName'].setValue(this.firstFormGroup.controls['OrgName'].getRawValue());
//   this.thirdFormGroup.controls['ReqRole'].setValue(this.firstFormGroup.controls['ReqRole'].getRawValue());
//   this.thirdFormGroup.controls['SystemName'].setValue(this.firstFormGroup.controls['SystemName'].getRawValue());

//   this.thirdFormGroup.controls['SystemOwner'].setValue(this.firstFormGroup.controls['SystemOwner'].getRawValue());
//   this.thirdFormGroup.controls['ISO'].setValue(this.firstFormGroup.controls['ISO'].getRawValue());

//   this.thirdFormGroup.controls['ReqPurpose'].setValue(this.secondFormGroup.controls['ReqPurpose'].getRawValue());
//   this.thirdFormGroup.controls['ReqWhatValueToAnticipate'].setValue(this.secondFormGroup.controls['ReqWhatValueToAnticipate'].getRawValue());
//   this.thirdFormGroup.controls['ReqHowManyTech'].setValue(this.secondFormGroup.controls['ReqHowManyTech'].getRawValue());
//   this.thirdFormGroup.controls['ReqHowPlannedUsage'].setValue(this.secondFormGroup.controls['ReqHowPlannedUsage'].getRawValue());
//   this.thirdFormGroup.controls['ReqWillOtherTeams'].setValue(this.secondFormGroup.controls['ReqWillOtherTeams'].getRawValue());
//   this.thirdFormGroup.controls['ReqWhichTeams'].setValue(this.secondFormGroup.controls['ReqWhichTeams'].getRawValue());

//   this.thirdFormGroup.controls['ReqName'].disable();
//   this.thirdFormGroup.controls['ReqVAEmail'].disable();
//   this.thirdFormGroup.controls['Date'].disable();
// }
// else if (event == 1)
// {
//   this.secondFormGroup.controls['ReqPurpose'].setValue(this.thirdFormGroup.controls['ReqPurpose'].getRawValue());
//   this.secondFormGroup.controls['ReqWhatValueToAnticipate'].setValue(this.thirdFormGroup.controls['ReqWhatValueToAnticipate'].getRawValue());
//   this.secondFormGroup.controls['ReqHowManyTech'].setValue(this.thirdFormGroup.controls['ReqHowManyTech'].getRawValue());
//   this.secondFormGroup.controls['ReqHowPlannedUsage'].setValue(this.thirdFormGroup.controls['ReqHowPlannedUsage'].getRawValue());
//   this.secondFormGroup.controls['ReqWillOtherTeams'].setValue(this.thirdFormGroup.controls['ReqWillOtherTeams'].getRawValue());
//   this.secondFormGroup.controls['ReqWhichTeams'].setValue(this.thirdFormGroup.controls['ReqWhichTeams'].getRawValue());
// }
// else if (event == 0)
// {

//   this.firstFormGroup.controls['ReqName'].setValue(this.thirdFormGroup.controls['ReqName'].getRawValue());
//   this.firstFormGroup.controls['ReqVAEmail'].setValue(this.thirdFormGroup.controls['ReqVAEmail'].getRawValue());
//   this.firstFormGroup.controls['ReqPhoneNo'].setValue(this.thirdFormGroup.controls['ReqPhoneNo'].getRawValue());

//   this.firstFormGroup.controls['ProjectName'].setValue(this.thirdFormGroup.controls['ProjectName'].getRawValue());
//   this.firstFormGroup.controls['VASIID'].setValue(this.thirdFormGroup.controls['VASIID'].getRawValue());
//   this.firstFormGroup.controls['Date'].setValue(this.thirdFormGroup.controls['Date'].getRawValue());
//   this.firstFormGroup.controls['OrgName'].setValue(this.thirdFormGroup.controls['OrgName'].getRawValue());
//   this.firstFormGroup.controls['ReqRole'].setValue(this.thirdFormGroup.controls['ReqRole'].getRawValue());
//   this.firstFormGroup.controls['SystemName'].setValue(this.thirdFormGroup.controls['SystemName'].getRawValue());

//   this.firstFormGroup.controls['SystemOwner'].setValue(this.thirdFormGroup.controls['SystemOwner'].getRawValue());
//   this.firstFormGroup.controls['ISO'].setValue(this.thirdFormGroup.controls['ISO'].getRawValue());

//   this.firstFormGroup.controls['ReqName'].disable();
//   this.firstFormGroup.controls['ReqVAEmail'].disable();
//   this.firstFormGroup.controls['Date'].disable();

// }

// }

disableallfields()
{

  this.thirdFormGroup.disable();
  this.firstFormGroup.disable();
  this.secondFormGroup.disable();
  this.dialog.closeAll();
}


submit():void {
  const formData = new FormData(); 
  
  formData.append("File",this.allFiles[0])
  formData.append("ReqName",this.thirdFormGroup.controls['ReqName'].getRawValue());
  formData.append("ReqVAEmail",this.thirdFormGroup.controls['ReqVAEmail'].getRawValue());
  formData.append("ReqPhoneNo",this.thirdFormGroup.controls['ReqPhoneNo'].getRawValue());
  formData.append("ProjectName",this.thirdFormGroup.controls['ProjectName'].getRawValue());
  formData.append("VASIID",this.thirdFormGroup.controls['VASIID'].getRawValue());
  formData.append("Date",this.thirdFormGroup.controls['Date'].getRawValue());
  formData.append("OrgName",this.thirdFormGroup.controls['OrgName'].getRawValue());
  formData.append("ReqRole",this.thirdFormGroup.controls['ReqRole'].getRawValue());
  formData.append("SystemName",this.thirdFormGroup.controls['SystemName'].getRawValue());
  formData.append("SystemOwner",this.thirdFormGroup.controls['SystemOwner'].getRawValue());
  formData.append("ISO",this.thirdFormGroup.controls['ISO'].getRawValue());
  formData.append("ReqPurpose",this.thirdFormGroup.controls['ReqPurpose'].getRawValue());
  formData.append("ReqWhatValueToAnticipate",this.thirdFormGroup.controls['ReqWhatValueToAnticipate'].getRawValue());
  formData.append("ReqHowManyTech",this.thirdFormGroup.controls['ReqHowManyTech'].getRawValue());
  formData.append("ReqHowPlannedUsage",this.thirdFormGroup.controls['ReqHowPlannedUsage'].getRawValue());
  formData.append("ReqWillOtherTeams",this.thirdFormGroup.controls['ReqWillOtherTeams'].getRawValue());
  formData.append("ReqWhichTeams",this.thirdFormGroup.controls['ReqWhichTeams'].getRawValue());

  this._reqApiService.saveAPIRequest(formData).subscribe((resp:any)=> {
      if(resp.status =='success')
      {
        let dialogref = this.dialog.open(this.successDialog, {disableClose: true})
        //this.isRequestSubmitted=true;
        dialogref.afterClosed().subscribe(result =>{
        //alert('disalog ref closed');
        this.isRequestSubmitted=true;
        this.disableallfields();
        });
      }
  });
}

ReqWillOtherTeamsclick(selectedvalue:string)
{
  this.thirdFormGroup.controls['ReqWillOtherTeams'].setValue(selectedvalue);
  //this.thirdFormGroup.get('ReqWillOtherTeams').setValue(selectedvalue);

  this.SelectedValueReqWillOtherTeams = selectedvalue;
if(selectedvalue=="1") {

  this.secondFormGroup.get('ReqWhichTeams').setValidators(Validators.required);
  this.thirdFormGroup.get('ReqWhichTeams').setValidators(Validators.required);

  
 } else {
  
  this.secondFormGroup.get('ReqWhichTeams').clearValidators();
  this.secondFormGroup.get('ReqWhichTeams').setValidators(null); 
  this.secondFormGroup.get('ReqWhichTeams').setErrors(null); 

  this.thirdFormGroup.get('ReqWhichTeams').clearValidators();
  this.thirdFormGroup.get('ReqWhichTeams').setValidators(null); 
  this.thirdFormGroup.get('ReqWhichTeams').setErrors(null); 
  
}


}

ThirdReqWillOtherTeamsclick(selectedvalue:string)
{
  this.SelectedValueReqWillOtherTeams = selectedvalue;
  this.secondFormGroup.controls['ReqWillOtherTeams'].setValue(selectedvalue);
  //this.secondFormGroup.get('ReqWillOtherTeams').setValue(selectedvalue);
   if(selectedvalue=="1")
   {
     this.secondFormGroup.controls['ReqWhichTeams'].setValue('');
     this.thirdFormGroup.controls['ReqWhichTeams'].setValue('');
   }

   if(selectedvalue=="1") {

    this.secondFormGroup.get('ReqWhichTeams').setValidators(Validators.required);
    this.thirdFormGroup.get('ReqWhichTeams').setValidators(Validators.required);

    
   } else {
    
    this.secondFormGroup.get('ReqWhichTeams').clearValidators();
    this.secondFormGroup.get('ReqWhichTeams').setValidators(null); 
    this.secondFormGroup.get('ReqWhichTeams').setErrors(null); 

    this.thirdFormGroup.get('ReqWhichTeams').clearValidators();
    this.thirdFormGroup.get('ReqWhichTeams').setValidators(null); 
    this.thirdFormGroup.get('ReqWhichTeams').setErrors(null); 
// this.form.get('title').setValidators(null); 
// this.form.get('title').setErrors(null); 
    
  }
  var test = this.thirdFormGroup.valid;
}

  downloadUserRequestForm() {
    const link = document.createElement('a');
    link.setAttribute('target', '_blank');
    link.setAttribute('href', 'assets/files/TRM-API_Usage_Policy.pdf');
    link.setAttribute('download', 'TRM-API_Usage_Policy.pdf');
    document.body.appendChild(link);
    link.click();
    link.remove();
  }
  allFiles: any[] = [];

  async droppedFiles(allFiles: File[]): Promise<void> {  
    this.allFiles=[];
    const filesAmount = allFiles.length;
    let allowedfileTypes: string[] =[".pdf","application/pdf"];

    let isAllowedFileType:boolean = allowedfileTypes.includes(allFiles[0].type.toLowerCase())
    
    if(!isAllowedFileType)
    {
      this._snackbar.open('Only PDF files may be attached and uploaded.','X');
    }
    else
    {
      const isPDFFile = await isPDF(allFiles[0]);
      console.log("the dropped file is : "+ isPDFFile);
      if(!isPDFFile){
        this._snackbar.open('Only PDF files may be attached and uploaded.','X');
      }
      else{
        for (let i = 0; i < filesAmount; i++) {
          const file = allFiles[i];
          if(this.allFiles.length==0)
          {
            this.allFiles.push(file);
          }
        }

        //this.DDClick.nativeElement.textContent = "Drag and drop or CLICK to complete transfer";
        this.changeColor("#b9bec5");
        this.toggleShown(false);
      // console.log("DRAGdroppedfiles " + this.allFiles[0].name + " size= " + this.fileUpload.nativeElement.size);
        this.isDragDrop = true;
      }
    }
  
  }

  isThirdFormValid():boolean
  {
   if(this.thirdFormGroup.valid && this.allFiles.length>0)
    return true;
    else 
    return false;
  }

  async fileselected(selFile:any):Promise<void>
  {
    const file = selFile as File;
    let allowedfileTypes: string[] =[".pdf","application/pdf"]
    const elFileUpload = this.fileUpload.nativeElement;
    this.selectedfile = elFileUpload.files[0];
    let isAllowedFileType:boolean = allowedfileTypes.includes(elFileUpload.files[0].type.toLowerCase())
    
    if(isAllowedFileType)
    {
      const isPDFFile = await isPDF(this.selectedfile);
      console.log("the selected File is : "+ isPDFFile);
      if(!isPDFFile){
        this._snackbar.open('Only PDF files may be attached and uploaded.','X');
      }
      else{
        this.allFiles=[];
        if(this.allFiles.length ==0)
        {
          this.allFiles.push(this.selectedfile);
        }
      // console.log("fileselected " + this.fileUpload.nativeElement.name + " size= " + this.fileUpload.nativeElement.size);
        this.changeColor("whitesmoke");
        this.uploadfiletoAzurebob();
        console.log('file selected CLICK upload');
      }
   
    }
else
{
  //Show alert
}
  }
  isDragDrop = false;
  onFileClick():void {
    this.allFiles =[];
    //console.log("onFileClick hidden "+this.beingUploaded.nativeElement.hidden + " " + this.isDragDrop);
    // this check controls if the file selector is displayed or not
    //if ( !this.isDragDrop ) {
      // file selector window pops up
      console.log("fileupload visible: " + this.fileUpload.nativeElement.hidden);
      this.fileUpload.nativeElement.hidden = true; 
      const elfile = this.fileUpload.nativeElement;
      elfile.click();
      this.toggleShown(true);
    // } else {
    //   // file dragged into window
    //   console.log("onFileClick file DRAGGED into window ");
    //   // click calls uploadfiletoAzurebob()
    //   const efile = this.beingUploaded.nativeElement;
    //   efile.click();
    //   this.isDragDrop = false;
      
    // }
  }
 
  prepareFilesList(file) {
    this.changeColor("#b9bec5");
    this.uploadFilesSimulator(0, 0);
    this.toggleShown(false);
  }
  
    delayClosing(){
      var delaytime = 5 * 1000; // five seconds.
      setTimeout(() => {
        // this.toggleShown(true);
        },delaytime);
    }

  uploadFilesSimulator(index: number, anum: number) {
   // console.log("simulator " + index  + " " + this.allFiles[index].size + " " + anum);
    if ( anum == 0 ) {
      console.log("Reset progress bar to zero");
      this.allFiles[index].progress=0;
    }
    setTimeout(() => {
      if (anum >= this.allFiles[index].size || anum == 100) {
        console.log("upload complete");
        this.delayClosing();
        anum = 0;
        return;
      } else {
        var progressInterval = setInterval(() => {
          if (this.allFiles[index].progress >= 100) {
            console.log("Progress bar at 100%.  Stopping file upload similation");
            clearInterval(progressInterval);
            this.uploadFilesSimulator(index, anum);
          } else {
            anum+=5;
            this.allFiles[index].progress +=5;
          }
        }, 50);
      }

    }, 1000);
  }

  uploadfiletoAzurebob():void {
    console.log("uploadfiletoAzurebob called");
    console.log("isdevenvironment = "+ this.isdevenvironment);
    this.changeColor("#b9bec5");
    this.DDClick.nativeElement.textContent = "Drag and drop a file here or click";
    this.isdevenvironment =false;
    if ( !this.isdevenvironment ) { 
      this.toggleShown(false); 
      this.currentFile= this.allFiles[0];      
      // const accountName =environment.accountName;
      // const key=environment.key;
      // const StringToSign =
      //   accountName+ '\n';
      // var str =CryptoJS.HmacSHA256(StringToSign,CryptoJS.enc.Base64.parse(key));
      // var sig = CryptoJS.enc.Base64.stringify(str);
      // const sasToken ='sv=2021-12-02&ss=bfqt&srt=co&sp=rwdlacupitfx&se=2023-03-25T01:58:05Z&st=2023-03-22T17:58:05Z&spr=https&sig=4ITeeRkIv4tgw5EM%2BT4eL58lFUlSaQ194Bmo%2BptAAVk%3D';

      // const containerName=environment.containerName;
      // const pipeline =newPipeline (new AnonymousCredential(),{
      //   retryOptions: { maxTries: 4 }, // Retry options
      //   userAgentOptions: { userAgentPrefix: "AdvancedSample V1.0.0" }, // Customized telemetry string
      //   keepAliveOptions: {
      // // Keep alive is enabled by default, disable keep alive by setting false
      // enable: false
      // }
      // });
      // const blobServiceClient =new BlobServiceClient(`https://${accountName}.blob.core.usgovcloudapi.net?${sasToken}`)
      // const containerClient =blobServiceClient.getContainerClient(containerName)
      // if(!containerClient.exists()){
      //   containerClient.create()
      // }
      // const client = containerClient.getBlockBlobClient(this.currentFile.name)
      // const response =  client.uploadData(this.currentFile,{
      //   blockSize: 4 * 1024 * 1024, // 4MB block size
      //   concurrency: 20, // 20 concurrency
      //   onProgress: (ev) => console.log(ev),
      //   blobHTTPHeaders :{blobContentType:this.currentFile.type}
      // })
    // end chech if in production
    } else { 
      if ( this.isDragDrop ) {
        this.toggleShown(false); 
      }
      this.prepareFilesList(this.currentFile); 
    }
  }
  
}

