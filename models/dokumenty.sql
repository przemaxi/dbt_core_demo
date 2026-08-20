select d.dok_id, d.kom, p.p_dok_lp, p.opis
from crafty-chiller-504711-m7.test_data_set.dok as d
  left join crafty-chiller-504711-m7.test_data_set.p_dok as p on (d.dok_id = p.dok_id)
