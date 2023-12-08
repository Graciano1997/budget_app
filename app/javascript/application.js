// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
const btnHamburguer=document.querySelector("#hamburguer");
const btnClose=document.querySelector("#close");

btnHamburguer.addEventListener("click",()=>{
    document.querySelector(".mainMenu").classList.toggle("hide");
});

btnClose.addEventListener("click",()=>{
    document.querySelector(".mainMenu").classList.toggle("hide");
});