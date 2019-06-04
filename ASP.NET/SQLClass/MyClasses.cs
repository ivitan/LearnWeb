using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;

/// <summary>
///MyClasses 的摘要说明
/// </summary>
namespace newClasses
{
    public class superString
    {
        public string orgString;
        private int _i;
        private double _d;
        private DateTime _dt;

        public superString(string _s)  
        {
            orgString = _s;            
        }

        public int toInt() {
            _i = 0;
            try { _i = int.Parse(orgString); }
            catch { }
            return _i;
        }

        //2
        public double toDouble() {
            _d = 0;
            try { _d = double.Parse(orgString); }
            catch { }
            return _d;
        }

        //3
        public DateTime toDatetime() {
            _dt = new DateTime();
            try { _dt = DateTime.Parse(orgString); }
            catch { }
            return _dt;
        }
    }


    //自定义数据库连接类
    public class superConn{

        public OleDbConnection cnn;
        private OleDbCommand cmd;
        private OleDbDataReader datar;

        public superConn(string mdbFileName) {
            string _path = "~\\App_Data\\" + mdbFileName;
            string str_conn = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source="
                + System.Web.HttpContext.Current.Server.MapPath(_path);
                //MapPath(_path); 
            cnn = new OleDbConnection(str_conn);
        }

        // superConn.open()
        public void open() {
            cnn.Open();
        }

        public void close() {
            cnn.Close();
        }

        public OleDbDataReader GetDataReader(string _sql) {
            cmd = new OleDbCommand(_sql, cnn);
            datar = cmd.ExecuteReader();
            return datar;
        }
        public void insertData(string sql_insert)
        {
            cmd = new OleDbCommand(sql_insert, cnn);
            cmd.ExecuteNonQuery();

        }

        //返回DDL控件,表名列表
        public DropDownList GetDDLforTableList() {
            DropDownList _ddl = new DropDownList();

            cnn.Open();

            DataTable dt = cnn.GetSchema("Tables", null);

            foreach (DataRow dr in dt.Select("TABLE_TYPE='TABLE'"))
            {
                string s = dr["TABLE_NAME"].ToString();
                _ddl.Items.Add(new ListItem(s));

            }

            cnn.Close();

            return _ddl;
        }

        //返回table,详细表内容
        public Table GetTable(string _tableName) {
            Table _tbl = new Table();
            cnn.Open();
                        
            cmd = new OleDbCommand("SELECT * FROM "+_tableName, cnn);
            datar = cmd.ExecuteReader();


            int i_fcount = datar.FieldCount;

            TableHeaderRow thr = new TableHeaderRow();
            for (int i = 0; i < i_fcount; i++)
            {
                TableHeaderCell thd = new TableHeaderCell();
                thd.Text = datar.GetName(i);
                thr.Cells.Add(thd);

            }
            _tbl.Rows.Add(thr);



            while (datar.Read())
            {
                TableRow tr = new TableRow();
                for (int i = 0; i < i_fcount; i++)
                {
                    TableCell td = new TableCell();
                    td.Text = datar[i].ToString();
                    tr.Cells.Add(td);

                }

                _tbl.Rows.Add(tr);
            }


            cnn.Close();
            return _tbl;
        }

    }



    //自定义用户类
    public class superUserInfo {

        public string userID;
        public string userPWD;
        public Boolean autoLogin;

        private Boolean isLogin;
        

        public superUserInfo() {
            userID = ""; userPWD = ""; isLogin = false;
            autoLogin = false;

            try { ReadCookies();
            if (autoLogin) {
                tryLogin();
            }
            }
            catch { }
        }



        public Boolean tryLogin() {
            isLogin = false;
            superConn sconn = new superConn("DATA.MDB");
            sconn.open();
            string _sql = "select * from t_userinfo where u_userid='"+userID+"'";
            OleDbDataReader dr = sconn.GetDataReader(_sql);
            if (dr.Read()) {
                if (dr["u_pwd"].ToString() == userPWD) {
                    isLogin = true;
                }
            }
            sconn.close();
            return isLogin;

        }


        public void LogOut() {
            isLogin = false;
        }

        public Boolean GetIsLogin() {
            return isLogin;
        }

        public void SetCookies() {
            HttpCookie ck = new HttpCookie("ckLogin");
            ck.Values.Add("cID", userID);
            ck.Values.Add("cPWD", userPWD);
            ck.Values.Add("cAutoLogin", autoLogin.ToString());
            ck.Expires = DateTime.MaxValue;

            HttpContext.Current.Response.Cookies.Add(ck);
        }

        //读取cookie
        public void ReadCookies() {
            HttpCookie ck = HttpContext.Current.Request.Cookies["ckLogin"];
            if (ck != null)
            {
                userID = ck.Values["cID"];
                userPWD = ck.Values["cPWD"];
                autoLogin = Boolean.Parse(ck.Values["cAutoLogin"]);
            }
        }
    
    }


    //文件管理类
    public class superFile {

        public string _fileName;
        public string _fileTitle;
        public string _fileDir="~/filesDownload";

        //1
        public superFile() {
            _fileName = _fileTitle = "";
        }

        //2
        public superFile(int _id) {
            _fileName = _fileTitle = "";
            superConn sconn = new superConn("fileMNG.mdb");
            sconn.open();
            string _sql = "SELECT * FROM T_FILES WHERE f_id=" + _id;
            OleDbDataReader dr = sconn.GetDataReader(_sql);
            if (dr.Read())
            {
                _fileTitle = dr["f_title"].ToString();
                _fileName =  dr["f_name"].ToString();
            }
            sconn.close();
        
        }

        //下载
        public void fileDownload() {
            string _path = System.IO.Path.Combine(HttpContext.Current.Server.MapPath(_fileDir),_fileName);
           
                if (System.IO.File.Exists(_path))
                {

                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.Buffer = true;

                    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + _fileTitle);
                    HttpContext.Current.Response.ContentType = "application/unknow";
                    HttpContext.Current.Response.TransmitFile(_path);
                    HttpContext.Current.Response.End();

                }

        }

    
    }

  

}
