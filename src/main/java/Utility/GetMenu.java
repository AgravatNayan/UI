package Utility;

import org.json.JSONObject;

public class GetMenu {

	public static String GetMenuRights(JSONObject jmenu,String mainTag,String dtlTag,String subdtlTag,String keyTag,String flag)
	{
		///KeyTag VISIBLE,NAME,DELETE,VIEW,
		//FALG M-main,D-datils,S- subdtl
		String result="N";
		try {
			
			JSONObject mainmenu= (JSONObject) jmenu.get(mainTag);
			if(flag.equalsIgnoreCase("M"))
			{
				result = mainmenu.getString(keyTag);
			}else {
				JSONObject submenudtl =  (JSONObject) mainmenu.get("SUBMENU");
				submenudtl =  (JSONObject) submenudtl.get(dtlTag);
				if(flag.equalsIgnoreCase("D")) {
					result = submenudtl.getString(keyTag);
				}else {
					JSONObject menusubdtl =  (JSONObject) submenudtl.get("SUBMENU");
					menusubdtl =  (JSONObject) menusubdtl.get(subdtlTag);
					result = menusubdtl.getString(keyTag);
				}
				
			}
			
		} catch (Exception e) {
			
			if(keyTag.equalsIgnoreCase("NAME"))
			{result = "";}
			else {result = "N";}
			//System.out.println("Error in GetMenuRights : flag:"+flag+" mainTag:"+mainTag+" keyTag:"+keyTag+" Error:"+e.getMessage()+" menuString:"+menuString);
		}
		return result;
	}
	//// Main Menu
	public static String GetMainMenuName(JSONObject jmenu,String mainTag)
	{
		return GetMenuRights(jmenu,mainTag,"","","NAME","M");
	}
	public static String GetMainMenuVisible(JSONObject jmenu,String mainTag)//VISIBLE
	{
		return GetMenuRights(jmenu,mainTag,"","","VISIBLE","M");
	}
	public static String GetMainMenuView(JSONObject jmenu,String mainTag)//VIEW
	{
		return GetMenuRights(jmenu,mainTag,"","","VIEW","M");
	}
	public static String GetMainMenuCreate(JSONObject jmenu,String mainTag)//Create
	{
		return GetMenuRights(jmenu,mainTag,"","","CREATE","M");
	}
	public static String GetMainMenuDelete(JSONObject jmenu,String mainTag)//DELETE
	{
		return GetMenuRights(jmenu,mainTag,"","","DELETE","M");
	}
	public static String GetMainMenuUpdate(JSONObject jmenu,String mainTag)//Update
	{
		return GetMenuRights(jmenu,mainTag,"","","UPDATE","M");
	}
	///Details Menu
	public static String GetDetailsMenuName(JSONObject jmenu,String mainTag,String dtlTag)
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,"","NAME","D");
	}
	public static String GetDetailsMenuVisible(JSONObject jmenu,String mainTag,String dtlTag)//VISIBLE
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,"","VISIBLE","D");
	}
	public static String GetDetailsMenuView(JSONObject jmenu,String mainTag,String dtlTag)//VIEW
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,"","VIEW","D");
	}
	public static String GetDetailsMenuCreate(JSONObject jmenu,String mainTag,String dtlTag)//Create
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,"","CREATE","D");
	}
	public static String GetDetailsMenuDelete(JSONObject jmenu,String mainTag,String dtlTag)//DELETE
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,"","DELETE","D");
	}
	public static String GetDetailsMenuUpdate(JSONObject jmenu,String mainTag,String dtlTag)//Update
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,"","UPDATE","D");
	}
	///Sub Details
	public static String GetSubDetailsMenuName(JSONObject jmenu,String mainTag,String dtlTag,String subdtlTag)
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,subdtlTag,"NAME","S");
	}
	public static String GetSubDetailsMenuVisible(JSONObject jmenu,String mainTag,String dtlTag,String subdtlTag)//VISIBLE
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,subdtlTag,"VISIBLE","S");
	}
	public static String GetSubDetailsMenuView(JSONObject jmenu,String mainTag,String dtlTag,String subdtlTag)//VIEW
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,subdtlTag,"VIEW","S");
	}
	public static String GetSubDetailsMenuCreate(JSONObject jmenu,String mainTag,String dtlTag,String subdtlTag)//Create
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,subdtlTag,"CREATE","S");
	}
	public static String GetSubDetailsMenuDelete(JSONObject jmenu,String mainTag,String dtlTag,String subdtlTag)//DELETE
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,subdtlTag,"DELETE","S");
	}
	public static String GetSubDetailsMenuUpdate(JSONObject jmenu,String mainTag,String dtlTag,String subdtlTag)//Update
	{
		return GetMenuRights(jmenu,mainTag,dtlTag,subdtlTag,"UPDATE","S");
	}
}
