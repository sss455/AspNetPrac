using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap03
{
    public partial class FileUploadMulti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (upload.HasFile)
            {
                var result = "";
                foreach (HttpPostedFile postfile in upload.PostedFiles)
                {
                    postfile.SaveAs(Server.MapPath(
                        $"~/App_Data/doc/{Path.GetFileName(postfile.FileName)}"));
                    result += $"{postfile.FileName} ";
                    lblResult.Text = $"{result}をアップロードしました。";
                }
            }
        }
    }
}