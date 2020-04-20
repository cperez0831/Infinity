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
        public Int32 RecNo { get; set; }
        public string User { get; set; }
        private string StoredProcName { get; set; }
        public Int32 NextRecordNo { get; set; }
        public string FieldName { get; set; }

        public string FieldValue { get; set; }
        public DBUtil()
        {
            cstr = ConfigurationManager.ConnectionStrings["InfinityDevConnectionString"].ConnectionString;
            OpenConn();
        }

        private void OpenConn()
        {
            if (conn == null) { conn = new SqlConnection(cstr); }
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

        public void GetNextRecNo()
        {
            OpenConn();
           
            using (SqlCommand cmd = new SqlCommand("GetNextInfinityRecNo", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter prm = new SqlParameter("@RecNo", null);
                prm.Direction = ParameterDirection.Output;
                prm.SqlDbType = SqlDbType.BigInt;
                cmd.Parameters.Add(prm);

                try
                {
                    cmd.ExecuteNonQuery();
                    NextRecordNo = Convert.ToInt32(prm.Value.ToString());
                }
                catch (Exception ex)
                {
                    NextRecordNo = -1;
                }
            }  
            
        }

        public bool CancelThisRecord()
        {
            OpenConn();
            using (SqlCommand cmd = new SqlCommand("CancelRecord", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter prm = new SqlParameter("@RecNo", Convert.ToInt32(RecNo));
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.BigInt;
                cmd.Parameters.Add(prm);

                try
                {
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
            
        }

        public bool UpdateRecord()
        {
            OpenConn();
            using (SqlCommand cmd = new SqlCommand("UpdateRecord", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter prm = new SqlParameter("@RecNo", Convert.ToInt32(RecNo));
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.BigInt;
                cmd.Parameters.Add(prm);

                prm = new SqlParameter("@User", User);
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.VarChar;
                prm.Size = 50;
                cmd.Parameters.Add(prm);
                
                prm = new SqlParameter("@FieldName", FieldName);
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.VarChar;
                prm.Size = 100;
                cmd.Parameters.Add(prm);

                prm = new SqlParameter("@FieldValue", FieldValue);
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.VarChar;
                prm.Size = 100;
                cmd.Parameters.Add(prm);

                try
                {
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

    }
}