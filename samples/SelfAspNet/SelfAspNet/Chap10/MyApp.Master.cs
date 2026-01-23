using System;
using System.Data;
using System.Web.UI;

namespace SelfAspNet.Chap10
{
    public partial class MyApp : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sds.SelectParameters.Clear();
            sds.SelectParameters.Add("url", Request.AppRelativeCurrentExecutionFilePath);
            var reader = (IDataReader)sds.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                Page.Header.Title = reader["title"].ToString();
                Page.Header.Keywords = reader["keywd"].ToString();
                Page.Header.Description = reader["description"].ToString();
            }
        }
    }
}