using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap06
{
    public partial class ReqUrl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Dictionaryオブジェクトにプロパティ名とその結果をセット
            var dic = new Dictionary<string, string>();
            dic.Add("ApplicationPath", Request.ApplicationPath);
            dic.Add("CurrentExecutionFilePath", Request.CurrentExecutionFilePath);
            dic.Add("FilePath", Request.FilePath);
            dic.Add("Path", Request.Path);
            dic.Add("PathInfo", Request.PathInfo);
            dic.Add("PhysicalApplicationPath", Request.PhysicalApplicationPath);
            dic.Add("PhysicalPath", Request.PhysicalPath);
            dic.Add("RawUrl", Request.RawUrl);
            dic.Add("Url", Request.Url.ToString());
                    
            // DictionaryをGridViewにデータバインド
            grid.DataSource = dic;
            Page.DataBind();
        }
    }
}