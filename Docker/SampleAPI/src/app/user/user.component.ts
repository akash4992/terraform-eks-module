import { Component, OnInit,Injectable } from '@angular/core';

import {HttpClient} from '@angular/common/http'
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit{
  id:number=0;
  userName:string="";
  status:boolean=false;
  hideStatus:boolean=true;
  userList:any;

  readonly userAPIUrl = "https://localhost:7268/api";
  constructor(private http:HttpClient){
  }

  
  ngOnInit(): void {
    this.userList=this.http.get<any>(this.userAPIUrl+"/UserApp");//this.getUserList();
  }

  getUserList():Observable<any[]> {
    return this.http.get<any>(this.userAPIUrl+"/UserApp");
  }
  user = "New User";
   ShowForm() {
    this.hideStatus=false;
  }


  addInspection(data:any) {
    return this.http.post(this.userAPIUrl+"/UserApp",data);
  }
    save() {
      var data={};
      if(this.id>0){
        data={Id:this.id,name:this.userName,IsActive:true};
        this.http.put(this.userAPIUrl+"/UserApp",data).subscribe(res => {
          this.userList=res;
          var updateAddSuccess = document.getElementById('update-success-alert');
        if(updateAddSuccess) {
          updateAddSuccess.style.display = "block";
        }
        
  
        setTimeout(function() {
          if(updateAddSuccess) {
            updateAddSuccess.style.display = "none"
          }
        }, 4000);
        this.hideStatus=true;
      });

        
      }
      else{
       data={Name:this.userName,IsActive:true};
        //this.http.post(this.userAPIUrl+"/UserApp",data);
        this.addInspection(data).subscribe(res => {
          this.userList=res;
        var showAddSuccess = document.getElementById('add-success-alert');
      if(showAddSuccess) {
        showAddSuccess.style.display = "block";
      }
      

      setTimeout(function() {
        if(showAddSuccess) {
          showAddSuccess.style.display = "none"
        }
      }, 4000);
      this.hideStatus=true;
    });
  }
  }

  edit(data:any){
this.hideStatus=false;
this.id=data.id;
this.userName=data.name;
  }

  delete(id:number){
this.http.delete(this.userAPIUrl+"/userApp/"+id).subscribe(res=>{
  this.userList=res;
  var deletAddSuccess = document.getElementById('delete-success-alert');
      if(deletAddSuccess) {
        deletAddSuccess.style.display = "block";
      }
      

      setTimeout(function() {
        if(deletAddSuccess) {
          deletAddSuccess.style.display = "none"
        }
      }, 4000);
      this.hideStatus=true;
    });

  }
}
