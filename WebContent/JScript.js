function validate()

{

   if( document.myForm.Name.value == "" )
   {
     alert( "Please provide your name!" );
     document.myForm.Name.focus() ;
     return false;
   }

   if( document.myForm.EMail.value == "" )
   {
     alert( "Please provide your Email!" );
     document.myForm.EMail.focus() ;
     return false;
   }
   
   
   
   function validatePassword()
   {
      var a = document.form.pass.value;
      
       if(a=="")
       {
         alert("Please Enter Your Password");
         document.form.pass.focus();
         return false;
       }
       

       if ((a.length < 4) || (a.length > 8))
       {
         alert("Your Password must be 4 to 8 Character");
         document.form.pass.select();
         return false;
       }

  }

   

   

   function validateEmail()
   {
      var emailID = document.myForm.EMail.value;
      atpos = emailID.indexOf("@");
      dotpos = emailID.lastIndexOf(".");
      
     


      if( document.myForm.EMail.value == "" )
      {
          alert( "Please provide your Email!" );
          document.myForm.EMail.focus() ;
          return false;
      }

      else
      {

           var ret = validateEmail();
           if( ret == false )
           {
              return false;
           }

      }
      
      if (atpos < 1 || ( dotpos - atpos < 2 )) 
      {
          alert("Please enter correct email ID")
          document.myForm.EMail.focus() ;
          return false;
      }

      return( true );


   }
   
 
}

