using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Infinity
{
    public class DBUtil
    {
        public string cstr { get; set; }
        public SqlConnection conn { get; set; }
        public SqlParameter prm { get; set; }
        public SqlDataAdapter adp { get; set; }
        public SqlCommand cmd { get; set; }
        public string SolutionName { get; set; }
        public string FileName { get; set; }
        public string Stack { get; set; }
        public int RecNo { get; set; }
        public string User { get; set; }
        private string StoredProcName { get; set; }
        public DBUtil()
        {
            cstr = ConfigurationManager.ConnectionStrings["InfinityDevConnectionString"].ConnectionString;
            OpenConn();
        }

        private void OpenConn()
        {
            if (conn == null) { conn = new SqlConnection(cstr)};
            do
            {
                if (conn.State != ConnectionState.Open) { conn.Open(); } else { break; }
            } while (true);
        }
        public void LogError()
        {
            OpenConn();
            using (SqlCommand cmd = new SqlCommand("GetInfinityData", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "LogAllErrors";
                prm = new SqlParameter("@SolutionName", SolutionName);
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.VarChar;
                prm.Size = 50;
                cmd.Parameters.Add(prm);

                prm = new SqlParameter("@FileName", FileName);
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.VarChar;
                prm.Size = 50;
                cmd.Parameters.Add(prm);

                prm = new SqlParameter("@Stack", Stack);
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.VarChar;
                prm.Size = 10000;
                cmd.Parameters.Add(prm);

                cmd.ExecuteNonQuery();
            }
        }

        private void ExecRecord()
        {
            OpenConn();
            using (SqlCommand cmd = new SqlCommand("GetInfinityData", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = StoredProcName;
                prm = new SqlParameter("@RecNo", RecNo);
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.Int;
                cmd.Parameters.Add(prm);

                prm = new SqlParameter("@User", User);
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.VarChar;
                prm.Size = 50;
                cmd.Parameters.Add(prm);

                cmd.ExecuteNonQuery();
            }
        }
        public void DeleteRecord()
        {
            StoredProcName = "MarkRecordForDeletion";
            ExecRecord();
        }

        public void VerifyRecord()
        {
            StoredProcName = "VerifyRecord";
            ExecRecord();
        }

    }
}