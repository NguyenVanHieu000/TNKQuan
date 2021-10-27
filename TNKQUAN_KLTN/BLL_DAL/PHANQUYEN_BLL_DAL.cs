using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class PHANQUYEN_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public List<CHUCVU> LoadCHUCVU()
        {
            return qlTNKQ.CHUCVUs.Select(t => t).ToList();
        }
        public  IQueryable get_DataGVIEN()
        {
            return qlTNKQ.GIANGVIENs.Select(t => t);
        }
        public List<GVIENCHUCVU> get_DataGVCVu()
        {
            return qlTNKQ.GVIENCHUCVUs.Select(t=>t).ToList();
        }
        public GVIENCHUCVU get_DataGVCVU(string ID)
        {
            return qlTNKQ.GVIENCHUCVUs.SingleOrDefault(t => t.ID_CVU.Equals(ID));
        }
        public bool Insert_GVIENCVU(string ID_GV,string ID_CV)
        {
            try
            {
                GVIENCHUCVU gcvu = qlTNKQ.GVIENCHUCVUs.SingleOrDefault(t => t.ID_GVIEN.Equals(ID_GV));
                if (gcvu == null)
                {
                    GVIENCHUCVU insert = new GVIENCHUCVU();
                    insert.ID_GVIEN = ID_GV;
                    insert.ID_CVU = ID_CV;
                    qlTNKQ.GVIENCHUCVUs.InsertOnSubmit(insert);
                    qlTNKQ.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch(Exception)
            {
                return false;
                throw;
            }
        }
        public bool Delete_GVIENCVU(string ID_GV,string ID_CV)
        {
            try
            {
                GVIENCHUCVU gcvu = qlTNKQ.GVIENCHUCVUs.SingleOrDefault(t => t.ID_GVIEN.Equals(ID_GV)&& t.ID_CVU.Equals(ID_CV));
                qlTNKQ.GVIENCHUCVUs.DeleteOnSubmit(gcvu);
                qlTNKQ.SubmitChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
                throw;
            }
        }

       

    }
}
