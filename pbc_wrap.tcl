###################################################################################
### ASAGIDAKILERI KULLANMAK ICIN HER SEYIN ICINDE OLDUGU DCD FILE KULLANACAKSIN ###
### SADECE PROTEININ OLDUGUNDA SACMALIYOR, CUNKU CENTER HESABI SACMALIYOR       ###
###################################################################################


######################################################################
### Center multi-unit protein in pbc box with VMD
### Make sure you are in first frame of MD
######################################################################

# Join separate units for this first frame only
pbc join connected -now
pbc join residue -now

# Join the protein for all MD
pbc unwrap -sel "not waters" -all

# Place the protein in the center of the box
pbc wrap -centersel "not waters" -center com -compound residue -all


######################################################################
### Baska bir yol da su olabilir
######################################################################

# Burada dikkat edilmesi gereken, hareketsiz olan chain/segmenti referans olarak almak, ve daha sonra tüm proteinle tekrar wrap etmek
pbc wrap -center com -centersel "segname PROA or segname PROC" -compound fragment -all
pbc wrap -center com -centersel "protein" -compound fragment -all


