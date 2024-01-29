import { dfx_main_backend } from "../../declarations/dfx_main_backend";

window.addEventListener("load", async function(){
  const current = await dfx_main_backend.checkBalance();
  this.document.getElementById("value").innerText = Math.round(current * 100) / 100; 
});

document.querySelector("form").addEventListener("submit", async function(){
  const inputAmount = parseFloat(document.getElementById("amount").value); 
  const outputAmount = parseFloat(document.getElementById("amount2").value); 

  const button = document.getElementById("submit")
  const button2 = document.getElementById("submit2")

  button.setAttribute("disabled", true);
  button2.setAttribute("disabled", true);

  if ((document.getElementById("amount").value.length) != 0){
    await dfx_main_backend.topUp(inputAmount);
    await dfx_main_backend.compound();
  };

  if ((document.getElementById("amount2").value.length) != 0){
    await dfx_main_backend.withdrawl(outputAmount);
    await dfx_main_backend.compound();

  };

  const current = await dfx_main_backend.checkBalance();
  document.getElementById("value").innerText = Math.round(current * 100) / 100;
  document.getElementById("amount").value = "";
  document.getElementById("amount2").value = "";

  button.removeAttribute("disabled");
  button2.removeAttribute("disabled")
  
});
