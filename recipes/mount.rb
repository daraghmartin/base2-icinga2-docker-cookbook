include_recipe "xfs::default"
include_recipe "lvm::default"

lvm_volume_group 'vg_nfs' do
  physical_volumes ['/dev/xvdb']  # 100GB Volume provisioned by Cloudformation

  logical_volume 'lvol0' do
    size        '100%VG'
    filesystem  'xfs'
    mount_point location: '/data', options: 'noatime,nodiratime'
  end
end
