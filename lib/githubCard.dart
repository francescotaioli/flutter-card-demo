//https://www.dartlang.org/resources/dart-tips/dart-tips-ep-11
class GithubCard {
   String title;
   String avatar_url;
   String desciption;
   num star;
   num open_issues_count;

   GithubCard (String title, String avatar_url, String desciption, num star, num open_issues_count){
     this.title = title;
     this.avatar_url = avatar_url;
     this.desciption = desciption;
     this.star = star;
     this.open_issues_count = open_issues_count;
   }

   getTitle(){
     return this.title;
   }

   getDescription(){
     return this.desciption;
   }
   getAvatar(){
     return this.avatar_url;
   }

   getStar(){
     return this.star;
   }

   getOpenIssue(){
     this.open_issues_count;
   }
}