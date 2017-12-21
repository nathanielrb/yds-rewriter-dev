defmodule Dispatcher do
  use Plug.Router

  def start(_argv) do
    port = 80
    IO.puts "Starting Plug with Cowboy on port #{port}"
    Plug.Adapters.Cowboy.http __MODULE__, [], port: port
    :timer.sleep(:infinity)
  end

  plug Plug.Logger
  plug :match
  plug :dispatch

  match "/catalogs/*path" do
    Proxy.forward conn, path, "http://resource/catalogs/"
  end

  match "/datasets/*path" do
    Proxy.forward conn, path, "http://resource/datasets/"
  end

  match "/distributions/*path" do
    Proxy.forward conn, path, "http://resource/distributions/"
  end

  match "/catalog-records/*path" do
    Proxy.forward conn, path, "http://resource/catalog-records/"
  end
  
  match "/concepts/*path" do
    Proxy.forward conn, path, "http://resource/concepts/"
  end
  
  match "/concept-schemes/*path" do
    Proxy.forward conn, path, "http://resource/concept-schemes/"
  end
  
  match "/agents/*path" do
    Proxy.forward conn, path, "http://resource/agents/"
  end
  
  match "/aid-activities/*path" do
    Proxy.forward conn, path, "http://resource/aid-activities/"
  end
  
  match "/public-projects/*path" do
    Proxy.forward conn, path, "http://resource/public-projects/"
  end
  
  match "/subprojects/*path" do
    Proxy.forward conn, path, "http://resource/subprojects/"
  end
  
  match "/organizations/*path" do
    Proxy.forward conn, path, "http://resource/organizations/"
  end
  
  match "/spending-items/*path" do
    Proxy.forward conn, path, "http://resource/spending-items/"
  end
  
  match "/budget-items/*path" do
    Proxy.forward conn, path, "http://resource/budget-items/"
  end
  
  match "/expenditure-lines/*path" do
    Proxy.forward conn, path, "http://resource/expenditure-lines/"
  end
  
  match "/price-specifications/*path" do
    Proxy.forward conn, path, "http://resource/price-specifications/"
  end
  
  match "/amounts/*path" do
    Proxy.forward conn, path, "http://resource/amounts/"
  end
  
   match "/kae-codes/*path" do
    Proxy.forward conn, path, "http://resource/kae-codes/"
  end
  
  match "/addresses/*path" do
    Proxy.forward conn, path, "http://resource/addresses/"
  end
  
  match "/expense-approval-items/*path" do
    Proxy.forward conn, path, "http://resource/expense-approval-items/"
  end
  
   match "/financial-decisions/*path" do
    Proxy.forward conn, path, "http://resource/financial-decisions/"
  end
  
   match "/committed-items/*path" do
    Proxy.forward conn, path, "http://resource/committed-items/"
  end
  
   match "/subsidies/*path" do
    Proxy.forward conn, path, "http://resource/subsidies/"
  end
  
  match "/contracts/*path" do
    Proxy.forward conn, path, "http://resource/contracts/"
  end
  
   match "/decisions/*path" do
    Proxy.forward conn, path, "http://resource/decisions/"
  end
  
   match "/feks/*path" do
    Proxy.forward conn, path, "http://resource/feks/"
  end
  
   match "/official-administrative-changes/*path" do
    Proxy.forward conn, path, "http://resource/official-administrative-changes/"
  end
  
  match "/non-financial-decisions/*path" do
    Proxy.forward conn, path, "http://resource/non-financial-decisions/"
  end
  
  match "/group-national-agents/*path" do
    Proxy.forward conn, path, "http://resource/group-national-agents/"
  end
  
  match "/trade-activities/*path" do
    Proxy.forward conn, path, "http://resource/trade-activities/"
  end
  
  match "/collective-body-types/*path" do
    Proxy.forward conn, path, "http://resource/collective-body-types/"
  end
  
   match "/collective-body-kinds/*path" do
    Proxy.forward conn, path, "http://resource/collective-body-kinds/"
  end
  
  match "/regulatory-acts/*path" do
    Proxy.forward conn, path, "http://resource/regulatory-acts/"
  end
  
  match "/selection-criteria/*path" do
    Proxy.forward conn, path, "http://resource/selection-criteria/"
  end
  
  match "/places-of-interest/*path" do
    Proxy.forward conn, path, "http://resource/places-of-interest/"
  end
  
  match "/points/*path" do
    Proxy.forward conn, path, "http://resource/points/"
  end
  
  match "/line-strings/*path" do
    Proxy.forward conn, path, "http://resource/line-strings/"
  end
  
  match "/account-types/*path" do
    Proxy.forward conn, path, "http://resource/account-types/"
  end
  
  match "/countries/*path" do
    Proxy.forward conn, path, "http://resource/countries/"
  end
  
  match "/fek-types/*path" do
    Proxy.forward conn, path, "http://resource/fek-types/"
  end
  
 match "/award-criteria-combinations/*path" do
    Proxy.forward conn, path, "http://resource/award-criteria-combinations/"
  end  
   
 match "/criteria-weighting/*path" do
    Proxy.forward conn, path, "http://resource/criteria-weighting/"
  end  

 match "/transactions/*path" do
    Proxy.forward conn, path, "http://resource/transactions/"
  end  
 
 match "/disbursed-items/*path" do
    Proxy.forward conn, path, "http://resource/disbursed-items/"
  end  
  
  match "/statistical-indicators/*path" do
    Proxy.forward conn, path, "http://resource/statistical-indicators/"
  end  
  
   match "/municipalities/*path" do
    Proxy.forward conn, path, "http://resource/municipalities/"
  end  

   match "/postal-code-areas/*path" do
    Proxy.forward conn, path, "http://resource/postal-code-areas/"
  end  
  
   match "/decisions/*path" do
    Proxy.forward conn, path, "http://resource/decisions/"
  end  
 
 match "/organizational-units/*path" do
    Proxy.forward conn, path, "http://resource/organizational-units/"
  end  

  match "/people/*path" do
    Proxy.forward conn, path, "http://resource/people/"
  end  
  
   match "/non-financial-decisions/*path" do
    Proxy.forward conn, path, "http://resource/non-financial-decisions/"
  end  

  match "/organization-statuses/*path" do
    Proxy.forward conn, path, "http://resource/organization-statuses/"
  end  

    match "/organization-categories/*path" do
    Proxy.forward conn, path, "http://resource/organization-categories/"
  end 
 
     match "/roles/*path" do
    Proxy.forward conn, path, "http://resource/roles/"
  end  
 
     match "/organization-domains/*path" do
    Proxy.forward conn, path, "http://resource/organization-domains/"
  end 
  
     match "/organizational-unit-categories/*path" do
    Proxy.forward conn, path, "http://resource/organizational-unit-categories/"
  end  
  
    match "/vat-types/*path" do
    Proxy.forward conn, path, "http://resource/vat-types/"
  end
  
   match "/financial-indicators/*path" do
    Proxy.forward conn, path, "http://resource/financial-indicators/"
  end  
  
  match "/attachments/*path" do
    Proxy.forward conn, path, "http://resource/attachments/"
  end  
  
  match "/features/*path" do
    Proxy.forward conn, path, "http://resource/features/"
  end  
 
 match "/geometries/*path" do
    Proxy.forward conn, path, "http://resource/geometries/"
  end  
 
 match "/aggregates/*path" do
    Proxy.forward conn, path, "http://resource/aggregates/"
  end  
  
 match "/non-financial-indicators/*path" do
    Proxy.forward conn, path, "http://resource/non-financial-indicators/"
  end  

  match "/as/*path" do
    Proxy.forward conn, path, "http://as:8890/"
  end

  match _ do
    send_resp( conn, 404, "Route not found" )
  end

  IO.puts "Loading new dispatcher"

end
